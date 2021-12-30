import requests
from bs4 import BeautifulSoup
import time
import pandas as pd

"""
Veri seti www.emlakjet.com sitesinden çekilmiştir.
"""

col = ['Net Metrekare', 'Oda Sayısı', 'Banyo Sayısı', 'WC Sayısı', 'Binanın Yaşı', 'Isıtma Tipi', 'Balkon Durumu', 'Eşya Durumu', 'Site İçerisinde']
DATAFRAME = pd.DataFrame(columns=['Kira', 'Alan', 'Oda Sayısı', 'Banyo Sayısı', 'WC Sayısı', 'Bina Yaşı', 'Isıtma Tipi', 'Balkon Durumu', 'Eşya Durumu', 'Site İçerisinde'])


# Siteden veri çekmeyi sağlayan fonksiyon
def get_data():
    global col
    global DATAFRAME
    page = 1
    print(page)

    while page <= 18:
        time.sleep(0.1)
        url = "https://www.sahibinden.com/satilik/sahibinden/"
        print(url)
        response = requests.get(url)
        print(response)
        html_content = response.content
        
        soup = BeautifulSoup(html_content, "html.parser")

        # İstanbul-Beşiktaş'ta bulunan evlerin detaylı özelliklerine erişmek için url'ler alınacak
        house_urls = soup.find_all("div", {"class": "styles_listingItem__1asTK"})
        
        # Evlere ait url'ler birer birer gezilerek istenen veriler döngü içinde alınacak
        for url in house_urls:
            HOUSE = {} # Bir eve ait özellikleri tutmak için boş bir dictionary oluşturulacak

            house_url = "https://www.emlakjet.com" + url.find('a')['href']
            response_2 = requests.get(house_url)
            html_content_2 = response_2.content
            soup_2 = BeautifulSoup(html_content_2, "html.parser")

            price = soup_2.find("div", {"class": "styles_price__1e65F"}) # Eve ait fiyat bilgisi alınacak
            if price is None: # Fiyat bilgisi girilmemişse bir sonraki eve geç
                continue
            price = int(price.text.strip().split('TL')[0].replace(",", ""))

            HOUSE['Kira'] = price

            # Eve ait tüm bilgiler bir listeye alınacak
            detail_list = soup_2.find_all("div", {"class": "styles_tableColumn__2x6nG"})
            detail_dict = {}

            for i in range(0, len(detail_list), 2):
                key = detail_list[i].text.strip()
                value = detail_list[i+1].text.strip()
                detail_dict[key] = value # Eve ait tüm bilgiler dictionary'e eklendi
            
            flag = 0
            for i in col:
                if not i in detail_dict.keys(): # Eğer alınmak istenen bilgi yoksa flag = 1 yapılırak bir sonraki eve geçilecek
                    if i == "WC Sayısı":
                        detail_dict["WC Sayısı"] = 0
                        continue
                    if i == "Balkon Durumu":
                        detail_dict["Balkon Durumu"] = "Yok"
                        continue
                    if i == "Eşya Durumu":
                        detail_dict["Eşya Durumu"] = "Boş"
                        continue
                    flag = 1
                    break
            if flag == 1:
                continue

            # Eve ait bilgiler HOUSE'a teker teker eklenecek
            HOUSE['Alan'] = int(detail_dict['Net Metrekare'].split()[0])
            HOUSE['Oda Sayısı'] = detail_dict['Oda Sayısı']
            HOUSE['Bina Yaşı'] = detail_dict['Binanın Yaşı']
            HOUSE['Isıtma Tipi'] = detail_dict['Isıtma Tipi']
            HOUSE['Banyo Sayısı'] = detail_dict['Banyo Sayısı']
            try:
                if HOUSE['Banyo Sayısı'] == 'Yok':
                    HOUSE['Banyo Sayısı'] = 0
                HOUSE['Banyo Sayısı'] = int(HOUSE['Banyo Sayısı'])
            except:
                continue

            HOUSE['WC Sayısı'] = detail_dict['WC Sayısı']
            try:
                if HOUSE['WC Sayısı'] == 'Yok':
                    HOUSE['WC Sayısı'] = 0
                HOUSE['WC Sayısı'] = int(HOUSE['WC Sayısı'])
            except:
                continue
                
            HOUSE['Balkon Durumu'] = detail_dict['Balkon Durumu']
            HOUSE['Eşya Durumu'] = detail_dict['Eşya Durumu']
            HOUSE['Site İçerisinde'] = detail_dict['Site İçerisinde']

            if (not "Belirtilmemiş" in HOUSE.values()) and (HOUSE['Kira'] > 1000) and (HOUSE['Kira'] < 50000):
                DATAFRAME = DATAFRAME.append(HOUSE, ignore_index=True) # Eğer istenen şartlar sağlanıyorsa eve ait bilgiler DATAFRAME'e eklenecek

            print("Size: " + str(len(DATAFRAME)))

            # Son olarak DATAFRAME'de bulunan veriler csv dosyasına yazılacak
            DATAFRAME.to_csv('dataset_houses_besiktas1.csv', index = False, header=True, encoding="utf-8-sig")
            
            
        page += 1
        print("Page: " + str(page))

    print(DATAFRAME.head)
        

# ANA PROGRAM
if __name__ == "__main__":
    get_data()