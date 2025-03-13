//
//  DestinationModel.swift
//  Awesome Places
//
//  Created by Gaurav Patel on 11/03/25.
//

import UIKit

struct Destination {
    let name: String
    let imageURL: String
    let description: String
}

struct Category {
    let title: String
    let color: UIColor
    let destinations: [Destination]
}


let travelCategories: [Category] = [
    Category(title: "Natural Wonders",
             color: .systemGreen,
             destinations: [
                Destination(name: "Grand Canyon",
                            imageURL: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1a/cd/70/9b/guano-point.jpg?w=900&h=500&s=1",
                            description: "The Grand Canyon, carved by the Colorado River, is one of the most breathtaking natural wonders of the world. With layers of red rock revealing millions of years of geological history, it stretches over 277 miles long and is up to 18 miles wide. Visitors can experience stunning panoramic views, hike through diverse trails, and witness the beauty of the sunrise and sunset over the canyon's rim."),
                
                Destination(name: "Niagara Falls",
                            imageURL: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0d/a3/8b/5f/niagara-falls.jpg?w=900&h=-1&s=1",
                            description: "Niagara Falls is one of the world's most famous and powerful waterfalls, located on the border of the United States and Canada. It consists of three stunning waterfalls: Horseshoe Falls, American Falls, and Bridal Veil Falls. The falls attract millions of visitors each year with their mesmerizing beauty and thunderous roar, offering boat tours, observation decks, and breathtaking night illuminations."),
                
                Destination(name: "Santorini, Greece",
                            imageURL: "https://www.moon.com/wp-content/uploads/2020/03/Santorini.png",
                            description: "Santorini, an enchanting Greek island in the Aegean Sea, is renowned for its white-washed houses with blue domes, dramatic cliffs, and breathtaking sunsets. Formed from a volcanic eruption, the island offers stunning caldera views, ancient ruins, and beautiful black-sand beaches. Visitors can explore the charming villages of Oia and Fira, savor delicious Mediterranean cuisine, and relax by the crystal-clear waters of the Aegean."),
                
                Destination(name: "Mount Everest, Nepal",
                            imageURL: "https://cdn.mos.cms.futurecdn.net/D9bzCVeZLHQnZ6bUWvAkrW.jpg",
                            description: "Mount Everest, the tallest peak in the world at 29,032 feet, sits majestically in the Himalayas on the Nepal-Tibet border. A dream destination for climbers, it challenges adventurers with its harsh weather, extreme altitude, and awe-inspiring beauty. Even for non-climbers, the trek to Everest Base Camp offers breathtaking views of snow-capped mountains, serene monasteries, and a glimpse into Sherpa culture."),
                
                Destination(name: "Bali, Indonesia",
                            imageURL: "https://images.wanderon.in/blogs/new/2023/05/untitled-design-55.png",
                            description: "Bali, an island paradise in Indonesia, is famous for its stunning beaches, terraced rice fields, and rich cultural heritage. With its world-class surfing spots, luxurious resorts, and mystical temples like Uluwatu and Tanah Lot, Bali attracts travelers seeking both adventure and relaxation. Visitors can experience traditional Balinese dance, explore the lush jungles of Ubud, or unwind in tranquil beachfront villas."),
                
                Destination(name: "Great Barrier Reef, Australia",
                            imageURL: "https://media.cnn.com/api/v1/images/stellar/prod/210621212905-great-barrier-reef-unesco-danger-australia-intl-hnk.jpg?q=w_1600,h_1068,x_0,y_0,c_fill",
                            description: "The Great Barrier Reef, the world's largest coral reef system, stretches over 1,400 miles off the coast of Australia. Home to an astonishing variety of marine life, including vibrant coral formations, tropical fish, and majestic sea turtles, it is a paradise for divers and snorkelers. The reef's breathtaking beauty can also be admired through scenic helicopter rides and glass-bottom boat tours."),
                
                Destination(name: "Petra, Jordan",
                            imageURL: "https://i.natgeofe.com/n/5ba0cd81-b859-40a0-93f1-2d26ff6d5ef9/DHHXC2.jpg",
                            description: "Petra, an ancient city carved into the red sandstone cliffs of Jordan, is a UNESCO World Heritage Site and one of the New Seven Wonders of the World. Known as the 'Rose City' due to its pink-hued rock formations, Petra boasts stunning architectural marvels like Al-Khazneh (the Treasury) and the Monastery. Visitors must pass through the narrow Siq canyon to enter this breathtaking archaeological wonder."),
                
                Destination(name: "Dubai, United Arab Emirates",
                            imageURL: "https://cdn.britannica.com/15/189715-050-4310222B/Dubai-United-Arab-Emirates-Burj-Khalifa-top.jpg",
                            description: "Dubai, a futuristic metropolis in the United Arab Emirates, is famous for its towering skyscrapers, luxury shopping, and extravagant lifestyle. The city is home to the iconic Burj Khalifa, the tallest building in the world, as well as man-made islands like Palm Jumeirah. Visitors can explore the vast deserts, indulge in fine dining, or experience the vibrant nightlife in this ever-evolving global destination."),
                
                Destination(name: "Tokyo, Japan",
                            imageURL: "https://i.insider.com/5d264d1fb44ce765c0045293?width=1067&format=jpeg",
                            description: "Tokyo, the bustling capital of Japan, is a mesmerizing blend of traditional culture and cutting-edge technology. The city boasts vibrant districts like Shinjuku and Shibuya, historic temples like Senso-ji, and futuristic attractions like teamLab Borderless. Visitors can savor world-class sushi, explore anime culture in Akihabara, and witness the tranquility of cherry blossoms in Ueno Park."),
                
                Destination(name: "Bangkok, Thailand",
                            imageURL: "https://res-1.cloudinary.com/gorealtravel/image/upload/,f_auto,q_auto/v1563889832/production/marketing/city/5d3181c870428e0008e0845c/city_main_image/BANGKOK.webp",
                            description: "Bangkok’s nightlife is a thrilling mix of rooftop bars, night markets, and pulsating nightclubs. The city is home to world-class venues like Sky Bar and Octave, where visitors can sip cocktails with a view. The famous Khao San Road offers an energetic backpacker vibe, while Soi Cowboy delivers a glimpse into Bangkok’s wild side."),
                
                Destination(name: "Berlin, Germany",
                            imageURL: "https://www.frasershospitality.com/en/locations/germany/berlin/capri-by-fraser-berlin/city-guide/berlin-travel-guide/_jcr_content/root/container/column_controller_2068050587/column-1-wrapper/image_1207548571_cop.coreimg.jpeg/1714398416309/berlin-skyline.jpeg",
                            description: "Berlin is home to one of the most underground and exclusive club scenes in the world. From the legendary Berghain to eclectic venues like Sisyphos, the city thrives on electronic music and 24-hour parties. Whether you're into warehouse techno, live music, or vibrant beer gardens, Berlin’s nightlife offers something for every taste."),
                
                Destination(name: "Rio de Janeiro, Brazil",
                            imageURL: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/Cidade_Maravilhosa.jpg/800px-Cidade_Maravilhosa.jpg",
                            description: "Rio de Janeiro’s nightlife is as vibrant as its world-famous Carnival. The city comes alive at night with samba clubs, beach parties, and rooftop bars. Lapa, the heart of Rio’s nightlife, offers traditional samba dancing, while Copacabana and Ipanema host lively beach bars. Visitors can dance to Brazilian beats, sip caipirinhas, and experience the energy of Rio’s nightlife."),
                
                Destination(name: "Mykonos, Greece",
                            imageURL: "https://cms.througheternity.com/upload/CONF83/20230719/mykonos_bird_s_eye.jpg",
                            description: "Mykonos, known as the 'Ibiza of Greece,' is a luxurious island famous for its high-energy beach clubs and stylish nightlife. Party hotspots like Cavo Paradiso and Paradise Beach Club attract international DJs and elite crowds. Whether dancing under the stars, enjoying sunset cocktails in Little Venice, or exploring hidden beach bars, Mykonos guarantees a memorable night."),
                
                Destination(name: "Amsterdam, Netherlands",
                            imageURL: "https://i.natgeofe.com/n/c6a26999-5b8d-44a4-8a9e-68e728698a31/skyline-amsterdam-netherlands.jpg",
                            description: "Amsterdam’s nightlife is a mix of electronic music, canal-side bars, and historic pubs. The city is home to iconic clubs like Paradiso and De School, offering everything from deep house to live concerts. The famous Red Light District is a must-see, while Leidseplein and Rembrandtplein are hotspots for vibrant bars and late-night fun."),
                
                Destination(name: "Miami, USA",
                            imageURL: "https://media.istockphoto.com/id/1359725053/photo/sunset-in-miami-south-beach-florida-usa.jpg?s=612x612&w=0&k=20&c=UbhLc67oI5cq9VfAqf12GCgDMo325p52VcxSUwFUltU=",
                            description: "Miami’s nightlife is legendary, blending Latin beats with high-end beach club luxury. South Beach is packed with iconic spots like LIV and Story, where celebrities and top DJs frequent. Visitors can dance to reggaeton, enjoy cocktails with ocean views, or explore the vibrant Wynwood district’s artsy night scene."),
                
                Destination(name: "London, UK",
                            imageURL: "https://media.cntraveller.com/photos/66015c3f3db9bb835d98584a/16:9/w_2560%2Cc_limit/GettyImages-1464758942.jpg",
                            description: "London’s nightlife offers a mix of underground music venues, exclusive clubs, and historic pubs. Soho and Shoreditch are hotspots for trendy bars, while Fabric and Ministry of Sound attract dance music lovers. The city also boasts unique experiences like secret speakeasies, rooftop bars, and live jazz clubs in Camden.")
             ]),
    
    Category(title: "Nightlife",
             color: .systemOrange,
             destinations: [
                Destination(name: "Ibiza, Spain",
                            imageURL: "https://www.travelinglifestyle.net/wp-content/uploads/2022/08/best-beaches-ibiza-768x512.jpg.webp",
                            description: "Ibiza, a Spanish island in the Mediterranean Sea, is globally renowned for its legendary nightlife, world-class DJs, and vibrant clubbing scene. Beyond the parties, Ibiza boasts stunning beaches, crystal-clear waters, and a rich cultural heritage, including ancient towns and breathtaking coastal views. Whether seeking relaxation or high-energy entertainment, Ibiza offers a perfect mix of both."),
                
                Destination(name: "Las Vegas, USA",
                            imageURL: "https://airpano.ru/files/360video/vr-vegas/images/image2.jpg",
                            description: "Las Vegas, famously known as 'Sin City,' is an electrifying entertainment capital filled with extravagant casinos, luxurious hotels, and non-stop nightlife. Located in the Nevada desert, it is home to dazzling lights, world-famous shows, and iconic landmarks such as the Bellagio fountains and the Strip. Whether you're into gambling, fine dining, or high-energy nightclubs, Las Vegas offers endless excitement.")
             ]),
    
    Category(title: "Landmarks",
             color: .systemBlue,
             destinations: [
                Destination(name: "Eiffel Tower",
                            imageURL: "https://cdn.britannica.com/52/245552-050-3D7334F9/Eiffel-Tower-Paris.jpg",
                            description: "The Eiffel Tower is one of the most iconic landmarks in the world, standing proudly in the heart of Paris, France. Built in 1889 as the entrance arch for the World's Fair, this iron lattice tower rises 330 meters high. It offers breathtaking panoramic views of the city from its observation decks and remains a symbol of romance, elegance, and architectural brilliance."),
                
                Destination(name: "Great Wall Of China",
                            imageURL: "https://cdn.britannica.com/54/122154-050-4DA0F697/Great-Wall-of-China.jpg",
                            description: "The Great Wall of China is an extraordinary feat of human engineering, stretching over 13,000 miles across northern China. Built over centuries to protect Chinese states from invasions, it winds through mountains, deserts, and grasslands. Walking along the wall offers a glimpse into China's rich history, stunning landscapes, and the perseverance of ancient civilizations.")
             ]),
    
    Category(title: "Cultural",
             color: .systemPink,
             destinations: [
                
                Destination(name: "Varanasi, Uttar Pradesh",
                            imageURL: "https://s7ap1.scene7.com/is/image/incredibleindia/manikarnika-ghat-city-hero?qlt=82&ts=1727959374496",
                            description: "Varanasi, one of the world's oldest continuously inhabited cities, is a sacred Hindu pilgrimage site on the banks of the Ganges River. The city's ghats come alive with mesmerizing Ganga Aarti every evening, attracting devotees and tourists alike. Kashi Vishwanath Temple, Sarnath (where Buddha gave his first sermon), and the narrow alleys filled with ancient temples, silk weavers, and traditional street food define the cultural depth of Varanasi."),

                Destination(name: "Jaipur, Rajasthan",
                            imageURL: "https://ecoplore.com/wp-content/uploads/2021/06/Jaipur-3.jpg",
                            description: "Jaipur, the 'Pink City' of India, is a regal blend of history, architecture, and tradition. The city's iconic Hawa Mahal, with its 953 intricately designed windows, was built to allow royal women to observe the street processions. The grandeur of Amber Fort, the astronomical brilliance of Jantar Mantar, and the royal splendor of City Palace showcase Jaipur’s rich cultural heritage. Don't miss the bustling Johari Bazaar for traditional jewelry and Rajasthani handicrafts."),
                
                Destination(name: "Khajuraho, Madhya Pradesh",
                            imageURL: "https://d2228rr16d3wie.cloudfront.net/photos/places/Madhya+Pradesh/Khajuraho.webp",
                            description: "Khajuraho is world-renowned for its intricately sculpted temples, a UNESCO World Heritage Site. Built by the Chandela dynasty between the 9th and 12th centuries, these temples are famous for their erotic sculptures, which symbolize love, spirituality, and devotion. The temples, such as Kandariya Mahadeva and Lakshmana Temple, are a stunning example of medieval Indian architecture and artistry. The annual Khajuraho Dance Festival brings India’s classical dance forms to life against this historic backdrop."),
                
                Destination(name: "Hampi, Karnataka",
                            imageURL: "https://s7ap1.scene7.com/is/image/incredibleindia/a-journey-through-masthead-hero-1?qlt=82&ts=1727368343764",
                            description: "Hampi, once the capital of the Vijayanagara Empire, is a vast UNESCO-listed archaeological wonderland. The ruins of grand temples, royal enclosures, and market streets are spread across a boulder-strewn landscape. The Virupaksha Temple, dedicated to Lord Shiva, stands tall as an active place of worship. The Vittala Temple, with its legendary stone chariot and musical pillars, is a masterpiece of Dravidian architecture. Hampi is also known for its surreal sunsets from Matanga Hill."),
                
                Destination(name: "Kolkata, West Bengal",
                            imageURL: "https://s7ap1.scene7.com/is/image/incredibleindia/victoria-memorial-kolkata-west-bengal-hero?qlt=82&ts=1726644813308",
                            description: "Kolkata, the 'Cultural Capital of India,' is a city of literature, art, and history. Once the British colonial capital, it is home to grand structures like the Victoria Memorial and Howrah Bridge. The city celebrates the grand Durga Puja festival with magnificent pandals and processions. College Street, the Indian Museum, and the home of Nobel Laureate Rabindranath Tagore reflect its deep-rooted cultural essence. Street food like Kathi rolls and Rosogolla make Kolkata a delight for food lovers."),
                
                Destination(name: "Madurai, Tamil Nadu",
                            imageURL: "https://www.laurewanders.com/wp-content/uploads/2023/06/Things-to-do-in-Madurai-92.jpg",
                            description: "Madurai, one of the oldest cities in India, is best known for the magnificent Meenakshi Amman Temple. This grand temple, adorned with towering gopurams covered in thousands of colorful sculptures, is dedicated to Goddess Meenakshi and Lord Sundareswarar (Shiva). The city’s cultural vibrancy is reflected in its lively street markets, ancient festivals like Chithirai Thiruvizha, and traditional Tamil cuisine. Madurai is also called 'Thoonga Nagaram,' meaning the city that never sleeps."),
                
                Destination(name: "Konark, Odisha",
                            imageURL: "https://cdn.britannica.com/62/127462-050-A922A68B/Stone-chariot-wheel-Konark-Surya-Deula-India.jpg",
                            description: "Konark’s Sun Temple, a UNESCO World Heritage Site, is a 13th-century marvel dedicated to the Sun God. Built in the shape of a colossal chariot with intricately carved wheels and horses, this temple showcases the peak of Kalinga architecture. The site is famous for its artistic and scientific brilliance, with the wheels also functioning as sundials. Every year, the Konark Dance Festival draws classical dancers from across the country, adding to the cultural grandeur of the region."),
                
                Destination(name: "Rishikesh, Uttarakhand",
                            imageURL: "https://s7ap1.scene7.com/is/image/incredibleindia/lakshman-jhula-bridge-rishikesh-uttrakhand-city-1-hero?qlt=82&ts=1726646259495",
                            description: "Rishikesh, the 'Yoga Capital of the World,' is a serene town nestled in the Himalayas along the sacred Ganges River. This spiritual hub is home to ancient ashrams, yoga retreats, and iconic landmarks like the Beatles Ashram, where the famous band stayed. The town is famous for the evening Ganga Aarti at Triveni Ghat, adventure sports like river rafting, and the tranquil atmosphere of Laxman Jhula and Ram Jhula. It’s a perfect destination for both spiritual seekers and adventure enthusiasts."),
                
                Destination(name: "Udaipur, Rajasthan",
                            imageURL: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/20191207_City_Palace%2C_Udaipur_1701_7325.jpg/1920px-20191207_City_Palace%2C_Udaipur_1701_7325.jpg",
                            description: "Udaipur, the 'City of Lakes,' is a picturesque destination with stunning palaces, serene lakes, and a royal ambiance. The grand City Palace offers panoramic views of Lake Pichola, while the Lake Palace, now a luxury hotel, seems to float on water. The intricate carvings of Jagdish Temple, the romantic boat rides on Fateh Sagar Lake, and the folk performances at Bagore Ki Haveli bring alive the rich Rajasthani culture. Udaipur’s old city streets are lined with traditional handicrafts and vibrant marketplaces."),
                
                Destination(name: "Mahabalipuram, Tamil Nadu",
                            imageURL: "https://www.tamilnadutourism.tn.gov.in/img/pages/large-desktop/mahabalipuram-1655321073_8b2ce35853c44cd4f2d2.webp",
                            description: "Mahabalipuram, an ancient port city, is home to UNESCO-listed rock-cut monuments and temples. Built during the Pallava dynasty, the Shore Temple stands as a testament to early Dravidian architecture. The site features magnificent stone carvings, including Arjuna’s Penance, a grand rock relief, and the Five Rathas, monolithic structures carved from single rock formations. Known for its annual dance festival and scenic beachside setting, Mahabalipuram remains a cultural and architectural gem of South India."),
                
                Destination(name: "Machu Picchu",
                            imageURL: "https://cdn.adventure-life.com/11/29/63/MP/1300x820.webp",
                            description: "Machu Picchu, an ancient Incan citadel set high in the Andes Mountains of Peru, is one of the most spectacular archaeological sites in the world. Built in the 15th century, it remains a mystery how the Incas constructed this breathtaking city without modern tools. Surrounded by misty peaks and lush greenery, Machu Picchu is a UNESCO World Heritage Site and a bucket-list destination for travelers.")
                
             ]),
]


