User.create!(f_name: "Albert", l_name: "Tseng", email: "atseng3@gmail.com", password: "password")

# Neighborhood.create!(name: "Marina", 
#                      tag_line: "The Marina's fashionable exterior is reinforced by its romantic views of the Golden Gate Bridge and San Francisco Bay.", 
#                      description: "A dreamy neighborhood on the edge of the bay, the Marina entices shoppers, diners, and picnickers to crowd its boutique-lined streets and hilly green space. Offering unmatched views of the Golden Gate Bridge and front row seats to witness waters ferocity, this high-end haunt can be a bit intimidating. Sporting a come-hither type of trendiness, the Marina is busy with window browsers by day and bar hoppers by night.")
#               
# Neighborhood.create!(name: "Downtown", 
#                      tag_line: "Wake up early and stay out late in this 24-hour hotspot.", 
#                      description: "As the heart of the city, Downtown/Union Square is a never-ending stream of sights, sounds, smells, and places to shop (frugal wallets beware!). This neighborhood is known for 24-hour activity, whether you're sipping early morning cappuccinos at a sidewalk cafe or on your third round of late-night drinks at a high-roller's lounge. The bright lights of Downtown/Union Square act as a beacon for all those looking for a fast-paced urban atmosphere.")
# 
# Neighborhood.create!(name: "Mission District", 
#                      tag_line: "The Mission District's blend of class and crass evades definition as this colorful neighborhood changes from block to block.", 
#                      description: "The Mission Districts multifarious corridors comprise an invitingly seedy melting pot of cultures, cuisines, and cool kids. Dusty produce bins line the sidewalks in front of colorful Latino markets, and the aroma of fresh roasted coffee beans emanates from first-class cafes along this diverse neighborhood's main streets. Whether you're looking for upscale restaurants, lowbrow dive bars, the best taquerias, or simply delicious street food, the Mission delivers.")
# 
# Neighborhood.create!(name: "Financial District", 
#                      tag_line: "Important-looking people rush about this enterprising 9-to-5 neighborhood.", 
#                      description: "The Financial District is responsible for San Francisco's most recognizable skyline. Beneath the cluster of towers, businesspeople zip through the Financial District's sleek revolving doors. In this core San Francisco neighborhood, weekdays fly by as suits and cell phones speed walk past shoppers and vendors. If you wander into the Financial District post-happy hour or on the weekend and you're wondering where all the people went, find them at the Embarcadero's Ferry Building, a popular neighborhood hangout.")
# 
# Neighborhood.create!(name: "Pacific Heights", 
#                      tag_line: "Don your Sunday best before stepping out in this quiet and elegant neighborhood.", 
#                      description: "Regal mansions and prestigious buildings are the essence of Pacific Heights. This prim and proper neighborhood epitomizes old-world elegance and its quiet streets are mostly enlivened with passers-by appreciating Pacific Heights' jaw-dropping architectural grandeur. Not known for a boisterous atmosphere, this neighborhood is well suited to city dwellers looking for fancy suburban solace. For those looking to indulge in fast-paced San Francisco, Cow Hollow is nearby.")
# 
# Pad.create!(name: "Charming Victorian (Noe Valley)", 
#             address: "Clipper St, San Francisco, CA 94114, United States", 
#             owner_id: 1, 
#             neighborhood_id: 3,
#             description: "Charming room with private entrance in San Franciscos trendiest neighborhood--Noe Valley. This artists house is filled with original paintings, stained glass, color and light. Built in 1906, the Victorian home retains all its old qualities, but has been renovated to provide spaciousness and light.The bay windows and abundant skylights provide beautiful bay views and warm sunshine.
# 
# There is a newly remodeled jacuzzi bathtub, two outdoor decks with views and a lush and flower-filed garden with comfortable lounge chairs for you to relax in and admire the San Francisco skyline. A state of-the-art kitchen is available for you to use if you prefer to cook in, however 3 blocks are way, are some of the best Zagat rated restaurants in the country.
# 
# The bedroom is private with a separate entrance on the garden/basement level. The queen size bed is a brand new McCroskey handmade mattress rated one of the top 5 mattresses. The bathroom is shared when there are other guests and is located up 8 steps. It is kept immaculate.
# 
# If you choose to stay home for the evening, Netflix movies, a library of DVDs and free internet wi-fi are available. Children are welcome and my home is LGBTQ friendly.
# 
# Located just 3 blocks from Noe Valleys shopping district--24th Street has some of the Citys best restaurants, incredible coffee shops and unique clothing and independent shops. On Saturdays there is a charming farmers market where you can find fresh organic produce. cheeses, breads, honey and other gourmet foods. Local musicians provide entertainment.
# 
# Public transportation is safe and easily accessible just 1/2 block away. Buses run all night and you can get to almost anywhere in the city in about 20 minutes. Located right in the middle of San Francisco, we are a 15 minute walk to the Mission and Castro neighborhoods. Street parking is also very easy, which is a rarity for San Francisco.
# 
# Need a ride from the airport? A good friend of mine does personal transport for much less cost than a taxi. If youre interested I can arrange this for you.
# 
# Each morning I provide homemade pastries, local breads, fruit, juice and San Francisco artisanal coffee and teas. Enjoy it in the quiet and lush gardens and patios before heading out for a day of sightseeing.
# 
# As your gracious host, I am committed to helping to make your stay one that is unique and enjoyable. I can provide you with a list of the best places to eat and hang out in San Francisco, things you wont find in the tourist books. I became a host because I truly love meeting people from around the world, building community and sharing the San Francisco I deeply love.
# 
# My home is filled with charm and warmth, in San Franciscos most desired neighborhood. I am honored that you have chosen to stay with me and I promise you, you will not forget your experience. Looking forward to hosting you!")
# 
# 
# Amenity.create!(name: "Smoking Allowed", pad_id: 1)
# PadAmenity.create!(pad_id: 1, amenity_id: 1)
# Amenity.create!(name: "Pets Allowed", pad_id: 1)
# PadAmenity.create!(pad_id: 1, amenity_id: 2)
# 
# Pad.create!(name: "Quiet, private room in Marina SF", 
#             address: "Octavia Street, San Francisco, CA 94123, United States", 
#             owner_id: 1, 
#             neighborhood_id: 1,
#             description: "Gorgeous, comfortable room in Marina neighborhood apartment. Major downtown busline one block away. Walk to shops, dining, landmarks, parks and Fishermans Wharf in minutes! Your stay includes a bottle of wine to welcome you, plus most amenities (including towels, hair dryer, travel books and maps). WiFi/cable/flatscreen tv.
# 
# You can even walk to the Golden Gate Bridge from here! We are right on a beautiful park, and very close to the water and piers. This location is the best in the city!
# 
# I used to be a chef, so I have a nicely equipped kitchen with everything you would want to cook a meal at home. Or, if you prefer, I live within a few minutes walking distance from many great SF restaurants!
# 
# I love to travel, both backpacking and with airbnb, and I have had great experiences when using airbnb. I am looking forward to welcoming and meeting other travelers from around the world and other parts of the US. I work nights, so I am not home most of the day. But if you are a night owl, we could visit when I return from work. Otherwise, we can always grab a coffee in the morning or afternoon!")
# 
# Amenity.create!(name: "Smoking Allowed", pad_id: 2)
# PadAmenity.create!(pad_id: 2, amenity_id: 3)
# Amenity.create!(name: "Pets Allowed", pad_id: 2)
# PadAmenity.create!(pad_id: 2, amenity_id: 4)
# Amenity.create!(name: "TV", pad_id: 2)
# PadAmenity.create!(pad_id: 2, amenity_id: 5)