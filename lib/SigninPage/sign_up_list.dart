String? selectedDistrict = "Select District"; // = "Select District"
String? selectedThana = "Select Upazilla";
var district = {
  // List<String>
  "Select District": "Select District", // Selecting
  "Bagerhat": "Bagerhat-district", // Bagerhat
  "Bandarban": "Bandarban-district", // Bandarban
  "Barguna": "Barguna-district", // Barguna
  "Barishal": "Barishal-district", // Barishal
  "Bhola": "Bhola-district", // Bhola
  "Bogura": "Bogura-district", // Bogura
  "Brahmanbaria": "Brahmanbaria-district", // Brahmanbaria
  "Chandpur": "Chandpur-district", // Chandpur
  "Chapai Nawabganj": "Chapai Nawabganj-district", // Chapainawabganj
  "Chattogram": "Chattogram-district", // Chattogram
  "Chuadanga": "Chuadanga-district", // Chuadanga
  "Cox's Bazar": "Cox's Bazar-district", // Cox's Bazar
  "Cumilla": "Cumilla-district", // Cumilla
  "Dhaka": "Dhaka-district", // Dhaka
  "Dinajpur": "Dinajpur-district", // Dinajpur
  "Faridpur": "Faridpur-district", // Faridpur
  "Feni": "Feni-district", // Feni
  "Gaibandha": "Gaibandha-district", // Gaibandha
  "Gazipur": "Gazipur-district", // Gazipur
  "Gopalganj": "Gopalganj-district", // Gopalganj
  "Habiganj": "Habiganj-district", // Habiganj
  "Jamalpur": "Jamalpur-district", // Jamalpur
  "Jessore": "Jessore-district", // Jessore
  "Jhalakathi": "Jhalakathi-district", // Jhalakathi
  "Jhenaidah": "Jhenaidah-district", // Jhenaidah
  "Joypurhat": "Joypurhat-district", // Joypurhat
  "Khagrachari": "Khagrachari-district", // Khagrachari
  "Khulna": "Khulna-district", // Khulna
  "Kishoreganj": "Kishoreganj-district", // Kishoreganj
  "Kurigram": "Kurigram-district", // Kurigram
  "Kushtia": "Kushtia-district", // Kushtia
  "Lalmonirhat": "Lalmonirhat-district", // Lalmonirhat
  "Laxmipur": "Laxmipur-district", // Laxmipur
  "Madaripur": "Madaripur-district", // Madaripur
  "Magura": "Magura-district", // Magura
  "Manikganj": "Manikganj-district", // Manikganj
  "Meherpur": "Meherpur-district", // Meherpur
  "Moulvibazar": "Moulvibazar-district", // Moulvibazar
  "Munshiganj": "Munshiganj-district", // Munshiganj
  "Mymensingh": "Mymensingh-district", // Mymensingh
  "Naogaon": "Naogaon-district", // Naogaon
  "Narail": "Narail-district", // Narail
  "Narayanganj": "Narayanganj-district", // Narayanganj
  "Narsingdii": "Narsingdi-district", // Narsingdi
  "Natore": "Natore-district", // Natore
  "Netrokona": "Netrokona-district", // Netrokona
  "Nilphamari": "Nilphamari-district", // Nilphamari
  "Noakhali": "Noakhali-district", // Noakhali
  "Pabna": "Pabna-district", // Pabna
  "Panchagarh": "Panchagarh-district", // Panchagarh
  "Patuakhali": "Patuakhali-district", // Patuakhali
  "Pirojpur": "Pirojpur-district", // Pirojpur
  "Rajbari": "Rajbari-district", // Rajbari
  "Rajshahi": "Rajshahi-district", // Rajshahi
  "Rangamati": "Rangamati-district", // Rangamati
  "Rangpur": "Rangpur-district", // Rangpur
  "Satkhira": "Satkhira-district", // Satkhira
  "Shariatpur": "Shariatpur-district", // Shariatpur
  "Sherpur": "Sherpur-district", // Sherpur
  "Sirajganj": "Sirajganj-district", // Sirajganj
  "Sunamganj": "Sunamganj-district", // Sunamganj
  "Sylhet": "Sylhet-district", // Sylhet
  "Tangail": "Tangail-district", // Tangail
  "Thakurgaon": "Thakurgaon-district" // Thakurgaon
};

List districts = [];
// ignore: non_constant_identifier_names
DistrictDependentDropDown() {
  selectedDistrict = "Select District";
  districts.clear();
  thanas.clear();
  district.forEach((key, value) {
    districts.add(key);
  });
}

List thanas = [];
// ignore: non_constant_identifier_names
ThanaDependentDropDown(thanaShortName) {
  //thanas.clear();
  thana.forEach((key, value) {
    if (thanaShortName == value) {
      thanas.add(key);
    }
  });
  selectedThana = thanas[0];
}

//String? selectedThana = "Select Upazilla"; //  = "Select Upazilla"
var thana = {
  "Select Upazilla": "Select Upazilla", // Select
  "Mollahat": "Bagerhat-district", // Bagerhat
  "Rampal": "Bagerhat-district",
  "Mongla": "Bagerhat-district",
  "Moralganj": "Bagerhat-district",
  "Fakirhat": "Bagerhat-district",
  "Kachua": "Bagerhat-district",
  "Chitalmari": "Bagerhat-district",
  "Bagerhat Sadar": "Bagerhat-district",
  "Sarankhola": "Bagerhat-district", // Bagerhat
  "Alikadam": "Bandarban-district", //Bandarban
  "Lama": "Bandarban-district",
  "Naikhongchhari": "Bandarban-district",
  "Ruma": "Bandarban-district",
  "Bandarban Sadar": "Bandarban-district",
  "Thanchi": "Bandarban-district",
  "Rowangchari": "Bandarban-district", //Bandarban
  "Amtali": "Barguna-district", // Barguna
  "Barguna Sadar": "Barguna-district",
  "Betagi": "Barguna-district",
  "Bamna": "Barguna-district",
  "Taltali": "Barguna-district",
  "Patharghata": "Barguna-district", // Barguna
  "Gournadi": "Barishal-district", // Barishal
  "Hizla": "Barishal-district",
  "Muladi": "Barishal-district",
  "Barishal Sadar": "Barishal-district",
  "Agailjhara": "Barishal-district",
  "Babuganj": "Barishal-district",
  "Wazirpur": "Barishal-district",
  "Mehendiganj": "Barishal-district",
  "Banaripara": "Barishal-district",
  "Bakerganj": "Barishal-district", // Barishal
  "Tazumuddin": "Bhola-district", // Bhola
  "Borhanuddin": "Bhola-district",
  "Monpura": "Bhola-district",
  "Bhola Sadar": "Bhola-district",
  "Lalmohan": "Bhola-district",
  "Daulatkhan": "Bhola-district",
  "Charfesson": "Bhola-district", // Bhola
  "Dhunat": "Bogura-district", // Bogura
  "Shibganj": "Bogura-district",
  "Adamdighi": "Bogura-district",
  "Nandigram": "Bogura-district",
  "Sonatola": "Bogura-district",
  "Sariakandi": "Bogura-district",
  "Shajahanpur": "Bogura-district",
  "Bogura Sadar": "Bogura-district",
  "Kahaloo": "Bogura-district",
  "Gabtali": "Bogura-district",
  "Sherpur": "Bogura-district",
  "Dupchanchia": "Bogura-district", // Bogura
  "Akhaura": "Brahmanbaria-district", // Brahmanbaria
  "Brahmanbaria Sadar": "Brahmanbaria-district",
  "Ashuganj": "Brahmanbaria-district",
  "Sarail": "Brahmanbaria-district",
  "Nabinagar": "Brahmanbaria-district",
  "Bancharampur": "Brahmanbaria-district",
  "Bijoynagar": "Brahmanbaria-district",
  "Nasirnagar": "Brahmanbaria-district",
  "Kasba": "Brahmanbaria-district", // Brahmanbaria
  "Hajiganj": "Chandpur-district", // Chandpur
  "Chandpur Sadar": "Chandpur-district",
  "Haimchar": "Chandpur-district",
  "Faridganj": "Chandpur-district",
  "Matlab (North)": "Chandpur-district",
  "Matlab (South)": "Chandpur-district",
  "Kachua": "Chandpur-district",
  "Shahrasti": "Chandpur-district", // Chandpur
  "Bholahat": "Chapai Nawabganj-district", // Chapainawabganj
  "Nachole": "Chapai Nawabganj-district",
  "Shibganj": "Chapai Nawabganj-district",
  "Gomostapur": "Chapai Nawabganj-district",
  "Chapai Nawabganj Sadar": "Chapai Nawabganj-district", // Chapainawabganj
  "Fatikchari": "Chattogram-district", // Chattogram
  "Rangunia": "Chattogram-district",
  "Satkania": "Chattogram-district",
  "Shitakunda": "Chattogram-district",
  "Mirsharai": "Chattogram-district",
  "Hathazari": "Chattogram-district",
  "Anwara": "Chattogram-district",
  "Chandanaish": "Chattogram-district",
  "Rawzan": "Chattogram-district",
  "Boalkhali": "Chattogram-district",
  "Karnafuli": "Chattogram-district",
  "Lohagara": "Chattogram-district",
  "Sandwip": "Chattogram-district",
  "Patiya": "Chattogram-district",
  "Banshkhali": "Chattogram-district", // Chattogram
  "Alamdanga": "Chuadanga-district", // Chuadanga
  "Chuadanga Sadar": "Chuadanga-district",
  "Damurhuda": "Chuadanga-district",
  "Jibannagar": "Chuadanga-district", // Chuadanga
  "Chakaria": "Cox's Bazar-district", // Cox's Bazar
  "Pekua": "Cox's Bazar-district",
  "Cox's Bazar Sadar": "Cox's Bazar-district",
  "Ukhia": "Cox's Bazar-district",
  "Teknaf": "Cox's Bazar-district",
  "Kutubdia": "Cox's Bazar-district",
  "Maheshkhali": "Cox's Bazar-district",
  "Ramu": "Cox's Bazar-district", // Cox's Bazar
  "Barura": "Cumilla-district", // Cumilla
  "Meghna": "Cumilla-district",
  "Monoharganj": "Cumilla-district",
  "Burichang": "Cumilla-district",
  "Muradnagar": "Cumilla-district",
  "Adarsha Sadar": "Cumilla-district",
  "Debidwar": "Cumilla-district",
  "Cumilla Sadar(South)": "Cumilla-district",
  "Laksam": "Cumilla-district",
  "Nangolkot": "Cumilla-district",
  "Chouddagram": "Cumilla-district",
  "Homna": "Cumilla-district",
  "Lalmai": "Cumilla-district",
  "Brahmanpara": "Cumilla-district",
  "Titas": "Cumilla-district",
  "Daudkandi": "Cumilla-district", // Cumilla
  "Keraniganj": "Dhaka-district", // Dhaka
  "Dohar": "Dhaka-district",
  "Nawabganj": "Dhaka-district",
  "Dhamrai": "Dhaka-district",
  "Savar": "Dhaka-district",
  "Adabor": "Dhaka-district",
  "Badda": "Dhaka-district",
  "Bandar": "Dhaka-district",
  "Bangshal": "Dhaka-district",
  "Biman Bandar": "Dhaka-district",
  "Cantonment": "Dhaka-district",
  "Chawkbazar": "Dhaka-district",
  "Dakshinkhan": "Dhaka-district",
  "Darus Salam": "Dhaka-district",
  "Demra": "Dhaka-district",
  "Dhanmondi": "Dhaka-district",
  "Gendaria": "Dhaka-district",
  "Gulshan": "Dhaka-district",
  "Hazaribagh": "Dhaka-district",
  "Jatrabari": "Dhaka-district",
  "Kadamtali": "Dhaka-district",
  "Kafrul": "Dhaka-district",
  "Kalabagan": "Dhaka-district",
  "Kamrangirchar": "Dhaka-district",
  "Keraniganj": "Dhaka-district",
  "Khilgaon": "Dhaka-district",
  "Khilkhet": "Dhaka-district",
  "Kotwali": "Dhaka-district",
  "Lalbagh": "Dhaka-district",
  "Mirpur": "Dhaka-district",
  "Mohammadpur": "Dhaka-district",
  "Motijheel": "Dhaka-district",
  "Narayanganj Sadar": "Dhaka-district",
  "New Market": "Dhaka-district",
  "Pallabi": "Dhaka-district",
  "Paltan": "Dhaka-district",
  "Ramna": "Dhaka-district",
  "Rampura": "Dhaka-district",
  "Sabujbagh": "Dhaka-district",
  "Savar": "Dhaka-district",
  "Shah Ali": "Dhaka-district",
  "Shahbagh": "Dhaka-district",
  "Sher-E-Bangla Nagar": "Dhaka-district",
  "Shyampur": "Dhaka-district",
  "Sutrapur": "Dhaka-district",
  "Tejgaon": "Dhaka-district",
  "Tejgaon": "Dhaka-district",
  "Turag": "Dhaka-district",
  "Uttara": "Dhaka-district",
  "Uttar Khan": "Dhaka-district", // Dhaka
  "Biral": "Dinajpur-district", // Dinajpur
  "Birganj": "Dinajpur-district",
  "Dinajpur Sadar": "Dinajpur-district",
  "Bochaganj": "Dinajpur-district",
  "Birampur": "Dinajpur-district",
  "Khansama": "Dinajpur-district",
  "Hakimpur": "Dinajpur-district",
  "Ghoraghat": "Dinajpur-district",
  "Chirirbandar": "Dinajpur-district",
  "Parbatipur": "Dinajpur-district",
  "Kaharole": "Dinajpur-district",
  "Phulbari": "Dinajpur-district",
  "Nawabganj": "Dinajpur-district", // Dinajpur
  "Alfadanga": "Faridpur-district", // Faridpur
  "Saltha": "Faridpur-district",
  "Bhanga": "Faridpur-district",
  "Char Bhadrasan": "Faridpur-district",
  "Faridpur Sadar": "Faridpur-district",
  "Boalmari": "Faridpur-district",
  "Madhukhali": "Faridpur-district",
  "Nagarkanda": "Faridpur-district",
  "Sadarpur": "Faridpur-district", // Faridpur
  "Chagalnaiya": "Feni-district", // Feni
  "Danganbhuiyan": "Feni-district",
  "Fulgazi": "Feni-district",
  "Sonagazi": "Feni-district",
  "Feni Sadar": "Feni-district",
  "Parshuram": "Feni-district", // Feni
  "Sundarganj": "Gaibandha-district", // Gaibandha
  "Fulchhari": "Gaibandha-district",
  "Palashbari": "Gaibandha-district",
  "Sadullapur": "Gaibandha-district",
  "Gobindaganj": "Gaibandha-district",
  "Saghata": "Gaibandha-district",
  "Gaibandha Sadar": "Gaibandha-district", // Gaibandha
  "Gazipur Sadar": "Gazipur-district", // Gazipur
  "kaliganj": "Gazipur-district",
  "sreepur": "Gazipur-district",
  "Kapasia": "Gazipur-district",
  "Kaliakair": "Gazipur-district",
  "Tongi": "Gazipur-district", // Gazipur
  "Tungipara": "Gopalganj-district", // Gopalganj
  "Kotalipara": "Gopalganj-district",
  "Gopalganj Sadar": "Gopalganj-district",
  "Kashiani": "Gopalganj-district",
  "Maksudpur": "Gopalganj-district", // Gopalganj
  "Chunarughat": "Habiganj-district", // Habiganj
  "Shayestaganj": "Habiganj-district",
  "Bahubal": "Habiganj-district",
  "Madhabpur": "Habiganj-district",
  "Ajmiriganj": "Habiganj-district",
  "Nabiganj": "Habiganj-district",
  "Habiganj Sadar": "Habiganj-district",
  "Lakhai": "Habiganj-district",
  "Baniachong": "Habiganj-district", // Habiganj
  "Bksiganj": "Jamalpur-district", // Jamalpur
  "Dewanganj": "Jamalpur-district",
  "Jamalpur Sadar": "Jamalpur-district",
  "Madarganj": "Jamalpur-district",
  "Sarishabari": "Jamalpur-district",
  "Melandah": "Jamalpur-district",
  "Islampur": "Jamalpur-district", // Jamalpur
  "Abhaynagar": "Jessore-district", // Jashore
  "Bagherpara": "Jessore-district",
  "Jessore Sadar": "Jessore-district",
  "Keshabpur": "Jessore-district",
  "Jhikargacha": "Jessore-district",
  "Sharsha": "Jessore-district",
  "Chougachha": "Jessore-district",
  "Manirampur": "Jessore-district", // Jessore
  "Nalchity": "Jhalakathi-district", // Jhalakathi
  "Rajapur": "Jhalakathi-district",
  "Jhalakathi Sadar": "Jhalakathi-district",
  "Kathalia": "Jhalakathi-district", // Jhalakathi
  "Shailkupa": "Jhenaidah-district", // Jhenaidah
  "Moheshpur": "Jhenaidah-district",
  "Jhenaidah Sadar": "Jhenaidah-district",
  "Kotchandpur": "Jhenaidah-district",
  "Harinakunda": "Jhenaidah-district",
  "kaliganj": "Jhenaidah-district", // Jhenaidah
  "Joypurhat Sadar": "Joypurhat-district", // Joypurhat
  "Panchbibi": "Joypurhat-district",
  "Akkelpur": "Joypurhat-district",
  "Khetlal": "Joypurhat-district",
  "Kalai": "Joypurhat-district", // Joypurhat
  "Laxmichhari": "Khagrachari-district", // Khagrachari
  "Khagrachari Sadar": "Khagrachari-district",
  "Matiranga": "Khagrachari-district",
  "Panchhari": "Khagrachari-district",
  "Mohalchari": "Khagrachari-district",
  "Manikchhari": "Khagrachari-district",
  "Dighinala": "Khagrachari-district",
  "Ramgarh": "Khagrachari-district", // Khagrachari
  "Terokhada": "Khulna-district", // Khulna
  "Batiaghata": "Khulna-district",
  "Dacope": "Khulna-district",
  "Rupsha": "Khulna-district",
  "Digholia": "Khulna-district",
  "Paikgachha": "Khulna-district",
  "Koyra": "Khulna-district",
  "Dumuria": "Khulna-district",
  "Fultala": "Khulna-district", // Khulna
  "Austagram": "Kishoreganj-district", // Kishoreganj
  "Katiadi": "Kishoreganj-district",
  "Bhairab": "Kishoreganj-district",
  "Kishoreganj Sadar": "Kishoreganj-district",
  "Bajitpur": "Kishoreganj-district",
  "Karimganj": "Kishoreganj-district",
  "Nikli": "Kishoreganj-district",
  "Kuliarchar": "Kishoreganj-district",
  "Tarail": "Kishoreganj-district",
  "Hossainpur": "Kishoreganj-district",
  "Mithamoin": "Kishoreganj-district",
  "Itna": "Kishoreganj-district",
  "Pakundia": "Kishoreganj-district", // Kishoreganj
  "Chilmari": "Kurigram-district", // Kurigram
  "Kurigram Sadar": "Kurigram-district",
  "Fulbari": "Kurigram-district",
  "Char Rajibpur": "Kurigram-district",
  "Bhurungamari": "Kurigram-district",
  "Rajarhat": "Kurigram-district",
  "Nageshwari": "Kurigram-district",
  "Rowmari": "Kurigram-district",
  "Ulipur": "Kurigram-district", // Kurigram
  "Kushtia Sadar": "Kushtia-district", // Kushtia
  "Kumarkhali": "Kushtia-district",
  "Daolatpur": "Kushtia-district",
  "Mirpur": "Kushtia-district",
  "Khoksa": "Kushtia-district",
  "Bheramara": "Kushtia-district", // Kushtia
  "Aditmari": "Lalmonirhat-district", // Lalmonirhat
  "Patgram": "Lalmonirhat-district",
  "Kaliganj": "Lalmonirhat-district",
  "Lalmonirhat Sadar": "Lalmonirhat-district",
  "Hatibandha": "Lalmonirhat-district", // Lalmonirhat
  "Raipur": "Laxmipur-district", // Laxmipur
  "Laxmipur Sadar": "Laxmipur-district",
  "Ramgati": "Laxmipur-district",
  "Kamalnagar": "Laxmipur-district",
  "Ramganj": "Laxmipur-district", // Laxmipur
  "Kalkini": "Madaripur-district", // Madaripur
  "Shibchar": "Madaripur-district",
  "Rajoir": "Madaripur-district",
  "Madaripur Sadar": "Madaripur-district", // Madaripur
  "Mohammadpur": "Magura-district", // Magura
  "Shalikha": "Magura-district",
  "Sreepur": "Magura-district",
  "Sreepur": "Magura-district",
  "Magura Sadar": "Magura-district", // Magura
  "Singair": "Manikganj-district", // Manikganj
  "Ghior": "Manikganj-district",
  "Shibalay": "Manikganj-district",
  "Saturia": "Manikganj-district",
  "Harirampur": "Manikganj-district",
  "Manikganj Sadar": "Manikganj-district",
  "Daulatpur": "Manikganj-district", // Manikganj
  "Meherpur Sadar": "Meherpur-district", // Meherpur
  "Mujibnagar": "Meherpur-district",
  "Gangni": "Meherpur-district", // Meherpur
  "Baralekha": "Moulvibazar-district", // Moulvibazar
  "Moulvibazar Sadar": "Moulvibazar-district",
  "Juri": "Moulvibazar-district",
  "Kamalganj": "Moulvibazar-district",
  "Sreemangal": "Moulvibazar-district",
  "Kulaura": "Moulvibazar-district",
  "Rajnagar": "Moulvibazar-district", // Moulvibazar
  "Gajaria": "Munshiganj-district", // Munshiganj
  "Munshiganj Sadar": "Munshiganj-district",
  "Tongibari": "Munshiganj-district",
  "Serajdikhan": "Munshiganj-district",
  "Louhajong": "Munshiganj-district",
  "Sreenagar": "Munshiganj-district", // Munshiganj
  "Dhobaura": "Mymensingh-district", // Mymensingh
  "Fulpur": "Mymensingh-district",
  "Trishal": "Mymensingh-district",
  "Muktagachha": "Mymensingh-district",
  "Fulbaria": "Mymensingh-district",
  "Ishwargonj": "Mymensingh-district",
  "Bhaluka": "Mymensingh-district",
  "Nandail": "Mymensingh-district",
  "Mymensingh Sadar": "Mymensingh-district",
  "Gaffargaon": "Mymensingh-district",
  "Gouripur": "Mymensingh-district",
  "Haluaghat": "Mymensingh-district", // Mymensingh
  "Badalgacchi": "Naogaon-district", // Naogaon
  "Dhamoirhat": "Naogaon-district",
  "Niamatpur": "Naogaon-district",
  "Porsha": "Naogaon-district",
  "Atrai": "Naogaon-district",
  "Patnitala": "Naogaon-district",
  "Manda": "Naogaon-district",
  "Mohadevpur": "Naogaon-district",
  "Sapahar": "Naogaon-district",
  "Naogaon Sadar": "Naogaon-district",
  "Raninagar": "Naogaon-district", // Naogaon
  "Kalia": "Narail-district", // Narail
  "Lohagara": "Narail-district",
  "Narail Sadar": "Narail-district", // Narail
  "Fatullah": "Narayanganj-district", // Narayanganj
  "Bandar": "Narayanganj-district",
  "Siddirganj": "Narayanganj-district",
  "Araihazar": "Narayanganj-district",
  "Rupganj": "Narayanganj-district",
  "Sonargaon": "Narayanganj-district",
  "Narayanganj Sadar": "Narayanganj-district", // Narayanganj
  "Monohardi": "Narsingdi-district", // Narsingdi
  "Palash": "Narsingdi-district",
  "Belabo": "Narsingdi-district",
  "Raipura": "Narsingdi-district",
  "Shibpur": "Narsingdi-district",
  "Narsingdi Sadar": "Narsingdi-district", // Narsingdi
  "Natore Sadar": "Natore-district", // Natore
  "Gurudaspur": "Natore-district",
  "Lalpur": "Natore-district",
  "Bagatipara": "Natore-district",
  "Baraigram": "Natore-district",
  "Singra": "Natore-district", // Natore
  "Atpara": "Netrokona-district", // Netrokona
  "Barhatta": "Netrokona-district",
  "Durghapur": "Netrokona-district",
  "Purbodhola": "Netrokona-district",
  "Kendua": "Netrokona-district",
  "Madan": "Netrokona-district",
  "Netrokona Sadar": "Netrokona-district",
  "Khaliajuri": "Netrokona-district",
  "Mohonganj": "Netrokona-district",
  "Kalma Kanda": "Netrokona-district", // Netrokona
  "Syedpur": "Nilphamari-district", // Nilphamari
  "Domar": "Nilphamari-district",
  "Jaldhaka": "Nilphamari-district",
  "Nilphamari Sadar": "Nilphamari-district",
  "Kishoreganj": "Nilphamari-district",
  "Dimla": "Nilphamari-district", // Nilphamari
  "Sunaimori": "Noakhali-district", // Noakhali
  "Kabirhat": "Noakhali-district",
  "Begumganj": "Noakhali-district",
  "Hatiya": "Noakhali-district",
  "Noakhali Sadar": "Noakhali-district",
  "Senbag": "Noakhali-district",
  "Chatkhil": "Noakhali-district",
  "Shubarnachar": "Noakhali-district",
  "Companigonj": "Noakhali-district", // Noakhali
  "Atgharia": "Pabna-district", // Pabna
  "Pabna Sadar": "Pabna-district",
  "Bhangura": "Pabna-district",
  "Chatmohar": "Pabna-district",
  "Faridpur": "Pabna-district",
  "Santhia": "Pabna-district",
  "Bera": "Pabna-district",
  "Ishwardi": "Pabna-district",
  "Sujanagar": "Pabna-district", // Pabna
  "Atwari": "Panchagarh-district", // Panchagarh
  "Boda": "Panchagarh-district",
  "Debiganj": "Panchagarh-district",
  "Panchagarh Sadar": "Panchagarh-district",
  "Tetulia": "Panchagarh-district", // Panchagarh
  "Patuakhali Sadar": "Patuakhali-district", // Patuakhali
  "Bawphal": "Patuakhali-district",
  "Dashmina": "Patuakhali-district",
  "Rangabali": "Patuakhali-district",
  "Mirzaganj": "Patuakhali-district",
  "Dhumki": "Patuakhali-district",
  "Kalapara": "Patuakhali-district",
  "Galachipa": "Patuakhali-district", // Patuakhali
  "Bhandaria": "Pirojpur-district", // Pirojpur
  "Pirojpur Sadar": "Pirojpur-district",
  "Nazirpur": "Pirojpur-district",
  "Mathbaria": "Pirojpur-district",
  "KawKhali": "Pirojpur-district",
  "Zianagar": "Pirojpur-district",
  "Nesarabad": "Pirojpur-district", // Pirojpur
  "Rajbari Sadar": "Rajbari-district", // Rajbari
  "Goalanda": "Rajbari-district",
  "Kalukhali": "Rajbari-district",
  "Baliakandi": "Rajbari-district",
  "Pangsa": "Rajbari-district", // Rajbari
  "Bagmara": "Rajshahi-district", // Rajshahi
  "Puthia": "Rajshahi-district",
  "Bagha": "Rajshahi-district",
  "Durgapur": "Rajshahi-district",
  "Paba": "Rajshahi-district",
  "Mohanpur": "Rajshahi-district",
  "Godagari": "Rajshahi-district",
  "Tanore": "Rajshahi-district",
  "Charghat": "Rajshahi-district", // Rajshahi
  "Bagaichhari": "Rangamati-district", // Rangamati
  "Juraichari": "Rangamati-district",
  "Barkal": "Rangamati-district",
  "Rangamati Sadar": "Rangamati-district",
  "Kaptai": "Rangamati-district",
  "Naniarchar": "Rangamati-district",
  "Langadu": "Rangamati-district",
  "Kawkhali": "Rangamati-district",
  "Rajasthali": "Rangamati-district",
  "Belaichhari": "Rangamati-district", // Rangamati
  "Taraganj": "Rangpur-district", // Rangpur
  "Rangpur Sadar": "Rangpur-district",
  "Pirgacha": "Rangpur-district",
  "Pirgonj": "Rangpur-district",
  "Badarganj": "Rangpur-district",
  "Kaunia": "Rangpur-district",
  "Gangachara": "Rangpur-district",
  "Mithapukur": "Rangpur-district", // Rangpur
  "Debhata": "Satkhira-district", // Satkhira
  "Tala": "Satkhira-district",
  "Kalaroa": "Satkhira-district",
  "Shaymnagar": "Satkhira-district",
  "Kaligonj": "Satkhira-district",
  "Satkhira Sadar": "Satkhira-district",
  "Ashasuni": "Satkhira-district", // Satkhira
  "Damudya": "Shariatpur-district", // Shariatpur
  "Naria": "Shariatpur-district",
  "Shariatpur Sadar": "Shariatpur-district",
  "Bhedarganj": "Shariatpur-district",
  "Shakhipur": "Shariatpur-district",
  "Goshairhat": "Shariatpur-district",
  "Zanjira": "Shariatpur-district", // Shariatpur
  "Nakhla": "Sherpur-district", // Sherpur
  "Sreebardi": "Sherpur-district",
  "Nalitabari": "Sherpur-district",
  "Sherpur Sadar": "Sherpur-district",
  "Jhenaigati": "Sherpur-district", // Sherpur
  "Belkuchi": "Sirajganj-district", // Sirajganj
  "Ullahpara": "Sirajganj-district",
  "Shahjadpur": "Sirajganj-district",
  "Chowhali": "Sirajganj-district",
  "Tarash": "Sirajganj-district",
  "Sirajganj Sadar": "Sirajganj-district",
  "Raiganj": "Sirajganj-district",
  "Kazipur": "Sirajganj-district",
  "Kamarkhand": "Sirajganj-district", // Sirajganj
  "Bishwamvarpur": "Sunamganj-district", // Sunamganj
  "Derai": "Sunamganj-district",
  "Jagannathpur": "Sunamganj-district",
  "Doarabazar": "Sunamganj-district",
  "Tahirpur": "Sunamganj-district",
  "Chhatak": "Sunamganj-district",
  "Sunamganj Sadar": "Sunamganj-district",
  "Jamalganj": "Sunamganj-district",
  "Sulla": "Sunamganj-district",
  "South Sunamganj": "Sunamganj-district",
  "Dharmapasha": "Sunamganj-district", // Sunamganj
  "Balaganj": "Sylhet-district", // Sylhet
  "Biswanath": "Sylhet-district",
  "Companiganj": "Sylhet-district",
  "Zakiganj": "Sylhet-district",
  "Kanaighat": "Sylhet-district",
  "Osmaninagar": "Sylhet-district",
  "South Shurma": "Sylhet-district",
  "Jaintapur": "Sylhet-district",
  "Gowainghat": "Sylhet-district",
  "Beanibazar": "Sylhet-district",
  "Sylhet Sadar": "Sylhet-district",
  "Golapganj": "Sylhet-district", // Sylhet
  "Tangail Sadar": "Tangail-district", // Tangail
  "Dhanbari": "Tangail-district",
  "Madhupur": "Tangail-district",
  "Kalihati": "Tangail-district",
  "Nagarpur": "Tangail-district",
  "Gopalpur": "Tangail-district",
  "Bhuapur": "Tangail-district",
  "Ghatail": "Tangail-district",
  "Mirzapur": "Tangail-district",
  "Bashail": "Tangail-district",
  "Delduar": "Tangail-district",
  "Shakhipur": "Tangail-district", // Tangail
  "Thakurgaon Sadar": "Thakurgaon-district", // Thakurgaon
  "Ranisankail": "Thakurgaon-district",
  "Pirganj": "Thakurgaon-district",
  "Baliadangi": "Thakurgaon-district",
  "Haripur": "Thakurgaon-district", // Thakurgaon
};
