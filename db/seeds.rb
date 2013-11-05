# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(f_name: 'Albert', l_name: 'Tseng', email: 'atseng3@gmail.com', password: 'password')

Pad.create!(name: "Charming Victorian (Noe Valley)", address: "Clipper St, San Francisco, CA 94114, United States", owner_id: 1, description: "Charming room with private entrance in San Francisco's trendiest neighborhood--Noe Valley. This artists house is filled with original paintings, stained glass, color and light. Built in 1906, the Victorian home retains all its old qualities, but has been renovated to provide spaciousness and light.The bay windows and abundant skylights provide beautiful bay views and warm sunshine.

There is a newly remodeled jacuzzi bathtub, two outdoor decks with views and a lush and flower-filed garden with comfortable lounge chairs for you to relax in and admire the San Francisco skyline. A state of-the-art kitchen is available for you to use if you prefer to cook in, however 3 blocks are way, are some of the best Zagat rated restaurants in the country.

The bedroom is private with a separate entrance on the garden/basement level. The queen size bed is a brand new McCroskey handmade mattress rated one of the top 5 mattresses. The bathroom is shared when there are other guests and is located up 8 steps. It is kept immaculate.

If you choose to stay home for the evening, Netflix movies, a library of DVDs and free internet wi-fi are available. Children are welcome and my home is LGBTQ friendly.

Located just 3 blocks from Noe Valleys shopping district--24th Street has some of the City's best restaurants, incredible coffee shops and unique clothing and independent shops. On Saturdays there is a charming farmers market where you can find fresh organic produce. cheeses, breads, honey and other gourmet foods. Local musicians provide entertainment.

Public transportation is safe and easily accessible just 1/2 block away. Buses run all night and you can get to almost anywhere in the city in about 20 minutes. Located right in the middle of San Francisco, we are a 15 minute walk to the Mission and Castro neighborhoods. Street parking is also very easy, which is a rarity for San Francisco.

Need a ride from the airport? A good friend of mine does personal transport for much less cost than a taxi. If you're interested I can arrange this for you.

Each morning I provide homemade pastries, local breads, fruit, juice and San Francisco artisanal coffee and teas. Enjoy it in the quiet and lush gardens and patios before heading out for a day of sightseeing.

As your gracious host, I am committed to helping to make your stay one that is unique and enjoyable. I can provide you with a list of the best places to eat and hang out in San Francisco, things you won't find in the tourist books. I became a host because I truly love meeting people from around the world, building community and sharing the San Francisco I deeply love.

My home is filled with charm and warmth, in San Francisco's most desired neighborhood. I am honored that you have chosen to stay with me and I promise you, you will not forget your experience. Looking forward to hosting you!")
Detail.create!(name: "Room Type", value: "Private room", pad_id: 1)
Detail.create!(name: "Bed Type", value: "Real Bed", pad_id: 1)
Detail.create!(name: "Accomodates", value: "1", pad_id: 1)
Detail.create!(name: "Check In", value: "4:00pm", pad_id: 1)
Detail.create!(name: "Check Out", value: "12:00pm", pad_id: 1)
Amenity.create!(name: "Smoking Allowed", pad_id: 1)
PadAmenity.create!(pad_id: 1, amenity_id: 1)
Amenity.create!(name: "Pets Allowed", pad_id: 1)
PadAmenity.create!(pad_id: 1, amenity_id: 2)

Pad.create!(name: "Quiet, private room in Marina SF", address: "Octavia Street, San Francisco, CA 94123, United States", owner_id: 1, description: "Gorgeous, comfortable room in Marina neighborhood apartment. Major downtown busline one block away. Walk to shops, dining, landmarks, parks and Fisherman's Wharf in minutes! Your stay includes a bottle of wine to welcome you, plus most amenities (including towels, hair dryer, travel books and maps). WiFi/cable/flatscreen tv.

You can even walk to the Golden Gate Bridge from here! We are right on a beautiful park, and very close to the water and piers. This location is the best in the city!

I used to be a chef, so I have a nicely equipped kitchen with everything you would want to cook a meal at home. Or, if you prefer, I live within a few minutes walking distance from many great SF restaurants!

I love to travel, both backpacking and with airbnb, and I have had great experiences when using airbnb. I am looking forward to welcoming and meeting other travelers from around the world and other parts of the US. I work nights, so I am not home most of the day. But if you are a night owl, we could visit when I return from work. Otherwise, we can always grab a coffee in the morning or afternoon!")
Detail.create!(name: "Room Type", value: "Private room", pad_id: 2)
Detail.create!(name: "Bed Type", value: "Real Bed", pad_id: 2)
Detail.create!(name: "Accomodates", value: "2", pad_id: 2)
Detail.create!(name: "Check In", value: "3:00pm", pad_id: 2)
Detail.create!(name: "Check Out", value: "12:00pm", pad_id: 2)
Amenity.create!(name: "Smoking Allowed", pad_id: 2)
PadAmenity.create!(pad_id: 2, amenity_id: 3)
Amenity.create!(name: "Pets Allowed", pad_id: 2)
PadAmenity.create!(pad_id: 2, amenity_id: 4)
Amenity.create!(name: "TV", pad_id: 2)
PadAmenity.create!(pad_id: 2, amenity_id: 5)