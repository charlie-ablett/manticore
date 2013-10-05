puts "Seeding database..."
Country.delete_all
Jurisdiction.delete_all
City.delete_all
Address.delete_all
User.delete_all

puts "old data cleared"

   nz = Country.create(name: 'New Zealand')
   canada = Country.create( name: 'Canada')

puts "added countries"

   bc = Jurisdiction.create(name: 'British Columbia', country_id: canada.id, kind: 'province')
   ab = Jurisdiction.create(name: 'Alberta', country_id: canada.id, kind: 'province')
   sk = Jurisdiction.create(name: 'Saskatchewan', country_id: canada.id, kind: 'province')
   mb = Jurisdiction.create(name: 'Manitoba', country_id: canada.id, kind: 'province')
   on = Jurisdiction.create(name: 'Ontario', country_id: canada.id, kind: 'province')
   pq = Jurisdiction.create(name: 'Quebec', country_id: canada.id, kind: 'province')
   pei = Jurisdiction.create(name: 'Prince Edward Island', country_id: canada.id, kind: 'province')
   ns = Jurisdiction.create(name: 'Nova Scotia', country_id: canada.id, kind: 'province')
   nb = Jurisdiction.create(name: 'New Brunswick', country_id: canada.id, kind: 'province')
   nf = Jurisdiction.create(name: 'Newfoundland', country_id: canada.id, kind: 'province')
   nv = Jurisdiction.create(name: 'Nunavut', country_id: canada.id, kind: 'territory')
   yk = Jurisdiction.create(name: 'Yukon', country_id: canada.id, kind: 'territory')
   nwt = Jurisdiction.create(name: 'Northwest Territories', country_id: canada.id, kind: 'territory')

   north = Jurisdiction.create(name: 'Northland', country_id: nz.id, kind: 'region')
   akl = Jurisdiction.create(name: 'Auckland', country_id: nz.id, kind: 'region')
   wai = Jurisdiction.create(name: 'Waikato', country_id: nz.id, kind: 'region')
   mawa = Jurisdiction.create(name: 'Manawatu-Wanganui', country_id: nz.id, kind: 'region')
   bop = Jurisdiction.create(name: 'Bay of Plenty', country_id: nz.id, kind: 'region')
   chat = Jurisdiction.create(name: 'Chatham Islands', country_id: nz.id, kind: 'region')
   gisb = Jurisdiction.create(name: 'Gisbourne', country_id: nz.id, kind: 'region')
   hawkb = Jurisdiction.create(name: "Hawke's Bay", country_id: nz.id, kind: 'region')
   tas = Jurisdiction.create(name: 'Tasman', country_id: nz.id, kind: 'region')
   tar = Jurisdiction.create(name: 'Taranaki', country_id: nz.id, kind: 'region')
   marl = Jurisdiction.create(name: 'Marlborough', country_id: nz.id, kind: 'region')
   ot = Jurisdiction.create(name: 'Otago', country_id: nz.id, kind: 'region')
   nel = Jurisdiction.create(name: 'Nelson', country_id: nz.id, kind: 'region')
   cant = Jurisdiction.create(name: 'Canterbury', country_id: nz.id, kind: 'region')
   west = Jurisdiction.create(name: 'Westland', country_id: nz.id, kind: 'region')
   south = Jurisdiction.create(name: 'Southland', country_id: nz.id, kind: 'region')
   wel = Jurisdiction.create(name: 'Wellington', country_id: nz.id, kind: 'region')

   nzblank = Jurisdiction.create(name: '', country_id: nz.id)
   cablank = Jurisdiction.create(name: '', country_id: canada.id)

puts "added jurisdictions"

   hamon = City.create(name: 'Hamilton', jurisdiction_id: on.id)
   hamwai = City.create(name: 'Hamilton', jurisdiction_id: wai.id)

   edmonton = City.create(name: 'Edmonton', jurisdiction_id: ab.id)
   calgary = City.create(name: 'Calgary', jurisdiction_id: ab.id)
   vancouver = City.create(name: 'Vancouver', jurisdiction_id: bc.id)
   vicbc = City.create(name: 'Victoria', jurisdiction_id: bc.id)
   saskatoon = City.create(name: 'Saskatoon', jurisdiction_id: sk.id)
   regina = City.create(name: 'Regina', jurisdiction_id: sk.id)
   mjaw = City.create(name: 'Moose Jaw', jurisdiction_id: sk.id)
   winnipeg = City.create(name: 'Winnipeg', jurisdiction_id: mb.id)
   ottawa = City.create(name: 'Ottawa', jurisdiction_id: on.id)
   toronto = City.create(name: 'Toronto', jurisdiction_id: on.id)
   montreal = City.create(name: 'Montréal', jurisdiction_id: pq.id)
   quebec = City.create(name: 'Quebec City', jurisdiction_id: pq.id)
   charl = City.create(name: 'Charlottetown', jurisdiction_id: pei.id)
   moncton = City.create(name: 'Moncton', jurisdiction_id: nb.id)
   white = City.create(name: 'Whitehorse', jurisdiction_id: yk.id)

   gisborne = City.create(name: 'Gisbourne', jurisdiction_id: gisb.id)
   tga = City.create(name: 'Tauranga', jurisdiction_id: bop.id)
   qt = City.create(name: 'Queenstown', jurisdiction_id: ot.id)
   nel = City.create(name: 'Nelson', jurisdiction_id: nel.id)
   welly = City.create(name: 'Wellington', jurisdiction_id: wel.id)
   rag = City.create(name: 'Raglan', jurisdiction_id: wai.id)

puts "added cities"

   craig1 = User.create(name: "Craig Schock", email: "cschock@waikato.ac.nz")
   craig2 = User.create(name: "Craig Schock", email: "craig.schock@gmail.com")
   craig3 = User.create(name: "Craig Smith", email: "craigsmith@gmail.com")
   craig4 = User.create(name: "Craig Smith-Jones", email: "csj@gmail.com")
   craig5 = User.create(name: "Craig Johnson", email: "cjohnson@example.com")
   ruth1 = User.create(name: "Ruth Ablett", email: "ruthablett@gmail.com")

puts "added users"

   addr1 = Address.create(user_id: craig1.id, street_number: 289, street_name: "Morrinsville Road", suburb_name: "Newstead", rural_delivery: "RD6", city_id: hamwai.id, post_code: '3216')
   addr2 = Address.create(user_id: ruth1.id, street_number: 289, street_name: "Morrinsville Road", suburb_name: "Newstead", rural_delivery: "RD6", city_id: hamwai.id, post_code: '3216')

   addr3 = Address.create(user_id: craig3.id, apartment_number: 12, street_number: 44, street_name: "Petunia Street", suburb_name: "Petone", city_id: welly.id, post_code: '4022')

   add4 = Address.create(user_id: craig4.id, apartment_number: 1, street_number: 864, street_name: "Government Road", city_id: rag.id, post_code: '3221')
   add5 = Address.create(user_id: craig5.id, street_number: 2, street_name: 'Waitangi Road', city_id: nel.id, post_code: '8098')

puts "added addresses"