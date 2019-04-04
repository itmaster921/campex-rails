if RegistrationStep.all.count == 0
  registration_steps = [
    { position: 0, name: 'Instructions', icon: 'info', url: '/dashboard/instructions', controller: 'dashboard', action: 'instructions' },
    { position: 1, name: 'Personal', icon: 'child', url: '/dashboard/personal', controller: 'dashboard', action: 'personal' },
    { position: 2, name: 'Address', icon: 'mail outline', url: '/dashboard/address', controller: 'dashboard', action: 'address' },
    { position: 3, name: 'Guardian', icon: 'users', url: '/dashboard/guardian', controller: 'dashboard', action: 'guardian' },
    { position: 4, name: 'Weightages', icon: 'exchange', url: '/dashboard/weightages', controller: 'dashboard', action: 'weightages' },
    { position: 5, name: 'Education', icon: 'university', url: '/dashboard/education', controller: 'dashboard', action: 'education' },
    { position: 6, name: 'Marks', icon: 'book', url: '/dashboard/marks', controller: 'dashboard', action: 'marks' },
    { position: 7, name: 'Choices', icon: 'list', url: '/dashboard/choices', controller: 'dashboard', action: 'choices' },
    { position: 8, name: 'Submission', icon: 'info', url: '/dashboard/submission', controller: 'dashboard', action: 'submission' },
  ].each{ |s| RegistrationStep.create(position: s[:position], name: s[:name], icon: s[:icon], url: s[:url], controller: s[:controller], action: s[:action])}
end

if Configurator.all.count == 0
  Configurator.create(max_enabled_step: 4)
end

if ReservationCategory.all.count == 0
  reservation_categories = {
    'GENERAL' => ['No Caste', 'Adiyodi', 'Ambalavasi', 'BRAHMIN', 'GUPTAN', 'KURUPPU', 'Kaimal',
      'MENON', 'NAIR', 'Nambeeshan', 'Nambiar', 'Namboodiri', 'Panicker', 'Pillai', 'Pisharody',
      'Rajput', 'Samantha', 'Thampi', 'Tharakan', 'WARRIER'],
    'SC' => ['Adi Andhra', 'Adi Dravida', 'Adi Karnataka', 'Ajila',
      'Arunthathiyar', 'Ayyanavar', 'Baira', 'Bakuda', 'Balija Naidu',
      'Balija', 'Bandi', 'Baratar', 'Bathada', 'Bathada', 'Bellara',
      'Bharathar', 'Boyan', 'Chakkiliyan', 'Chamar', 'Chandala',
      'Chemman', 'Chemmar', 'Cherama', 'Cheraman', 'Cheramar',
      'Cheruman', 'Domban', 'Gajalu Balija', 'Gavara', 'Gavarai Naidu',
      'Gavari', 'Godagal', 'Godda', 'Gosangi', 'Hasla', 'Holeya',
      'Kadaiyan', 'Kakkalan', 'Kakkan', 'Kalladi', 'Kanakkan', 'Kavara',
      'Kavarai', 'Koodan', 'Koosa', 'Koosa', 'Kootan', 'Kudumban',
      'Kuravar', 'Kuruva', 'Kuruvan', 'Maila', 'Mannan', 'Matha Pulayan',
      'Matha', 'Mavilan', 'Moger', 'Muchi', 'Mundala', 'Nalakeyava',
      'Nalkadaya', 'Nayadi', 'Nerian', 'Padanna', 'Padannan', 'Pallan',
      'Palluvan', 'Pambada', 'Panan', 'Panchama', 'Paraiya', 'Paraiyan',
      'Parathar', 'Paravan', 'Paraya', 'Parayan', 'Parayar', 'Perumannan',
      'Pulaya Vettuvan', 'Pulaya', 'Pulayan', 'Pulayar', 'Pulluvan',
      'Puthirai Vannan', 'Reneyar', 'Samagara', 'Samban', 'Sambava',
      'Sambavan', 'Sambavar', 'Semman', 'Sidhana', 'Sidhanar',
      'Thandan', 'Thotti', 'Valai Chetty', 'Vallon', 'Valluvan',
      'Vannan', 'Vedan', 'Velan', 'Vetan', 'Vettuvan', 'Vettuvan',
      'Wayanad Pulayan', 'Wayanadan Pulayan'],
    'ST' => ['Adiyan', 'Aranda', 'Arandan', 'Cholanaickan', 'Eravallan',
      'Hill Pulaya', 'Irulan', 'Irular', 'Jenu Kurumban', 'Kadar',
      'Kanikar', 'Kanikkaran', 'Karavazhi Pulayan', 'Karimpalan',
      'Kattunayakan', 'Kochuvelan', 'Konda Reddis', 'Kondakapus',
      'Koraga', 'Kota', 'Kudiya', 'Kurichchan', 'Kurichiyan', 'Kurumans',
      'Kurumba Pulayan', 'Kurumban', 'Kurumbar', 'Kurumbas', 'Mahamalasar',
      'Mala Arayan', 'Mala Kuruman', 'Mala Pulayan', 'Mala Vedan',
      'Mala Vettuvan', 'Malai Arayan', 'Malai Pandaran', 'Malai Vedan',
      'Malakkuravan', 'Malapanickar', 'Malasar', 'Malayarayar',
      'Mannan', 'Marati', 'Mavilan', 'Melakudi', 'Moopan', 'Mudugar',
      'Muduvan', 'Mulla Kuruman', 'Mullu Kuruman', 'Muthuvan',
      'Nattu Malayan', 'Paliyar', 'Palleyan', 'Palliya', 'Palliyan',
      'Pamba Pulayan', 'Paniyan', 'Ten Kurumban', 'Thachenadan',
      'Ulladan', 'Ullatan', 'Uraly', 'Vettakuruman', 'Wayanad Kadar'],
    'MUSLIM / MAPPILA' => ['Muslim', 'Mappila'],
    'OBH' => ['24 Manai Telungu Chetty', 'Agasa', 'Alan', 'Allan', 'Allar', 'Ambattan',
      'Andhra Nair', 'Anthuru Nair', 'Arayan', 'Arayavathi', 'Aremahrati', 'Asari', 'Ayar',
      'Ayiravar Nagarathar', 'Bestha', 'Bhandari Or Bhondari', 'Bovies', 'Boya', 'Boyan',
      'Chakkala', 'Chakkamar', 'Chaliya', 'Chaptegara', 'Chavalakkaran', 'Chemman', 'Chemmar',
      'Chettiyar', 'Chetty', 'Chingathan', 'Devadiga', 'Devanga', 'Dheevara', 'Dheevaran Atagara',
      'Dkaikolan', 'Elavaniya', 'Erindavan', 'Eruman', 'Ezhavathi', 'Ezhuthachan', 'Galada Konkani',
      'Ganaka', 'Ganika Including Nagavamsom', 'Ganjam Reddies', 'Gatti', 'Goldsmith', 'Golla',
      'Gowda', 'Gudigara', 'Hegde', 'Hindu Nadar', 'Idiga Including Settibalija', 'Illa Vellalar',
      'Illa', 'Illathar', 'Illathu Pillai', 'Illathu', 'Isanattu Kallar', 'Jangam',
      'Jhetty', 'Jogi', 'Kabera', 'Kadupattan', 'Kaikolan', 'Kalanadi', 'Kalari Panicker',
      'Kalarikurup', 'Kalasi Panicker', 'Kalavanthula', 'Kallan', 'Kallasari', 'Kalthachan',
      'Kamasalasa', 'Kammalas', 'Kani', 'Kanisan', 'Kanisu', 'Kaniyan', 'Kaniyar-Panicker',
      'Kannadiyans', 'Kannan', 'Kannian', 'Karanibhakatula', 'Karikalabhakulu', 'Karuvan',
      'Kavathi', 'Kavudiyaru', 'Kavuthyan', 'Kelasi', 'Kerala Muthali', 'Kharvi', 'Khatri',
      'Kitara', 'Kolaries', 'Kolayan', 'Kollan', 'Konga Malayan', 'Koppala Velamas', 'Korachas',
      'Krishnavaka', 'Kshatriya', 'Kudiyan', 'Kudumbi', 'Kulala', 'Kumbaran', 'Kunduvadiyan',
      'Kuruba', 'Kurumba', 'Kusavan', 'Madiga', 'Madivala', 'Mahratta', 'Malamuthan',
      'Malapanikkar', 'Malavettuvan', 'Malayaar', 'Malayal-Kammala', 'Malayaman', 'Malayan',
      'Maniyani', 'Maratis ', 'Maravan', 'Maravar', 'Maruthuvar', 'Matapathy', 'Mayar',
      'Melakudi', 'Meogers Of Kasargod Taluk', 'Modibanda', 'Mogaveera', 'Mogayan', 'Moili',
      'Moniagar', 'Moopanar', 'Moosari', 'Moovari', 'Mukaya', 'Mukhari', 'Mukkuvan',
      'Naickan Including Tholuva Naicker And Vettikara Naicker', 'Nainar', 'Natahaman',
      'Navithan', 'Nulayan', 'Nusuvan', 'Odan', 'Odda', 'Oudan', 'Padayachi', 'Padmasali',
      'Pallai', 'Pandaram', 'Pandikammala', 'Pandithar', 'Pandithattan', 'Panimalayan',
      'Panniyar Or Pannayar', 'Paravans Of Malabar Area Excluding Kasargod Taluk', 'Parkavakulam',
      'Pathiyan', 'Patnukaran', 'Pattarya', 'Pattusali', 'Perumkollan', 'Peruvannan', 'Pillai',
      'Pranopakari', 'Pulluvan', 'Rajaka', 'Rajapuri', 'Sadhu Chetty Including Telungu Chetty ',
      'Sagara', 'Sakravar', 'Sale', 'Sali', 'Saliyas', 'Samantha', 'Senaikudiayan', 'Senaithalivar',
      'Senapathula', 'Senguthar', 'Senguthar', 'Sivavellala', 'Sourashtra', 'Surithiman', 'Thachan',
      'Thachanadan Muppan', 'Thattan', 'Thogatta', 'Thokolan', 'Thongatta', 'Thottiyan', 'Uppara',
      'Ural Goundan', 'Vada Balija', 'Vadugan', 'Vaduvan', 'Vairagi', 'Vairavi', 'Vaisya Chetty',
      'Vakkaliga', 'Valaiyan', 'Valan', 'Vanibha Chetty', 'Vanika Vaisya', 'Vanika', 'Vaniyan',
      'Vannathan', 'Varnavar', 'Varnnavan', 'Veera Saivas', 'Velaan', 'Vellalar', 'Vellan',
      'Veluthedan', 'Veluthedathu Nair', 'Vilakkathalvan', 'Vilakkithal Nair', 'Vilasan', 'Vilkurup',
       'Viswabrahmins', 'Viswakarmala', 'Viswakarmas', 'Vodde', 'Wayanadan Chetty', 'Wayanadan Kadan',
       'Yadhava', 'Yogeeswar', 'Yogi'],
    'OBX' => ['Convert from Scheduled Caste to christianity', 'SIUC'],
    'ETB' => ['Billuva', 'Ezhavas', 'Illuvan', 'Ishuvan', 'Izhuvan', 'Thiyyas'],
    'BPL in forward class' => ['Adiyodi', 'Ambalavasi', 'BRAHMIN', 'GUPTAN', 'KURUPPU', 'Kaimal',
      'MENON', 'NAIR', 'Nambeeshan', 'Nambiar', 'Namboodiri', 'Panicker', 'Pillai', 'Pisharody',
      'Rajput', 'Samantha', 'Thampi', 'Tharakan', 'WARRIER'],
    'LC' => ['LC other than Anglo-Indians'],
    'O.E.C/SC' => ['Andhra Nair', 'Andhuru Nair', 'Arayan', 'Arayavathi', 'Chakkamar', 'Chemman',
      'Chemmar', 'Converted Scheduled castes', 'Deevaran', 'Dheevara', 'Kubharan', 'Kudumbi',
      'Kulalan', 'Kusavan', 'Madiga', 'Mukkuvan', 'Nulayan', 'Odan', 'Peruvannan', 'Pulluvan',
      'Thachar', 'Valan', 'Varnnavan', 'Vellan'],
    'O.E.C/ST' => ['Alan', 'Allan', 'Allar', 'Chinghathan', 'Erindavan', 'Kalanadi',
      'Konga Malayan', 'Kunduvadiyan', 'Malamuthan', 'Malapanikkar', 'Malavettuvan', 'Malayaar',
      'Malayan', 'Panimalayan', 'Pathiyan', 'Thachanadan Muppan', 'Wayanadu Kadan'],
    'ST-MUSLIM' => ['ETHNIC NATIVES OF LAKSHADWEEP'],
    'CHRISTIAN GENERAL' => ['CSI Christian', 'CSI Jacobite', 'Chaldean', 'Christian Others',
      'Jacobite', 'Knanaya Catholic', 'Knanaya Jacobite', 'Marthomite', 'ORTHODOX', 'PENTACOST',
      'ROMAN CATHOLIC', 'SYRIAN CATHOLIC', 'Syro Malankara Catholic']
  }

  reservation_categories.each do |category, castes|
    @category = ReservationCategory.new(name: category)
    success = @category.save
    if success
      castes.each do |subcaste|
        @subcaste = Caste.new(reservation_category: @category,
          name: subcaste)
        @subcaste.save
      end
    end
  end
end

if Country.all.count == 0
  countries = {
    'AF' => 'Afghanistan',
    'AX' => 'Aland Islands',
    'AL' => 'Albania',
    'DZ' => 'Algeria',
    'AS' => 'American Samoa',
    'AD' => 'Andorra',
    'AO' => 'Angola',
    'AI' => 'Anguilla',
    'AQ' => 'Antarctica',
    'AG' => 'Antigua And Barbuda',
    'AR' => 'Argentina',
    'AM' => 'Armenia',
    'AW' => 'Aruba',
    'AU' => 'Australia',
    'AT' => 'Austria',
    'AZ' => 'Azerbaijan',
    'BS' => 'Bahamas',
    'BH' => 'Bahrain',
    'BD' => 'Bangladesh',
    'BB' => 'Barbados',
    'BY' => 'Belarus',
    'BE' => 'Belgium',
    'BZ' => 'Belize',
    'BJ' => 'Benin',
    'BM' => 'Bermuda',
    'BT' => 'Bhutan',
    'BO' => 'Bolivia',
    'BA' => 'Bosnia And Herzegovina',
    'BW' => 'Botswana',
    'BV' => 'Bouvet Island',
    'BR' => 'Brazil',
    'IO' => 'British Indian Ocean Territory',
    'BN' => 'Brunei Darussalam',
    'BG' => 'Bulgaria',
    'BF' => 'Burkina Faso',
    'BI' => 'Burundi',
    'KH' => 'Cambodia',
    'CM' => 'Cameroon',
    'CA' => 'Canada',
    'CV' => 'Cape Verde',
    'KY' => 'Cayman Islands',
    'CF' => 'Central African Republic',
    'TD' => 'Chad',
    'CL' => 'Chile',
    'CN' => 'China',
    'CX' => 'Christmas Island',
    'CC' => 'Cocos (Keeling) Islands',
    'CO' => 'Colombia',
    'KM' => 'Comoros',
    'CG' => 'Congo',
    'CD' => 'Congo, Democratic Republic',
    'CK' => 'Cook Islands',
    'CR' => 'Costa Rica',
    'CI' => 'Cote D\'Ivoire',
    'HR' => 'Croatia',
    'CU' => 'Cuba',
    'CY' => 'Cyprus',
    'CZ' => 'Czech Republic',
    'DK' => 'Denmark',
    'DJ' => 'Djibouti',
    'DM' => 'Dominica',
    'DO' => 'Dominican Republic',
    'EC' => 'Ecuador',
    'EG' => 'Egypt',
    'SV' => 'El Salvador',
    'GQ' => 'Equatorial Guinea',
    'ER' => 'Eritrea',
    'EE' => 'Estonia',
    'ET' => 'Ethiopia',
    'FK' => 'Falkland Islands (Malvinas)',
    'FO' => 'Faroe Islands',
    'FJ' => 'Fiji',
    'FI' => 'Finland',
    'FR' => 'France',
    'GF' => 'French Guiana',
    'PF' => 'French Polynesia',
    'TF' => 'French Southern Territories',
    'GA' => 'Gabon',
    'GM' => 'Gambia',
    'GE' => 'Georgia',
    'DE' => 'Germany',
    'GH' => 'Ghana',
    'GI' => 'Gibraltar',
    'GR' => 'Greece',
    'GL' => 'Greenland',
    'GD' => 'Grenada',
    'GP' => 'Guadeloupe',
    'GU' => 'Guam',
    'GT' => 'Guatemala',
    'GG' => 'Guernsey',
    'GN' => 'Guinea',
    'GW' => 'Guinea-Bissau',
    'GY' => 'Guyana',
    'HT' => 'Haiti',
    'HM' => 'Heard Island & Mcdonald Islands',
    'VA' => 'Holy See (Vatican City State)',
    'HN' => 'Honduras',
    'HK' => 'Hong Kong',
    'HU' => 'Hungary',
    'IS' => 'Iceland',
    'IN' => 'India',
    'ID' => 'Indonesia',
    'IR' => 'Iran, Islamic Republic Of',
    'IQ' => 'Iraq',
    'IE' => 'Ireland',
    'IM' => 'Isle Of Man',
    'IL' => 'Israel',
    'IT' => 'Italy',
    'JM' => 'Jamaica',
    'JP' => 'Japan',
    'JE' => 'Jersey',
    'JO' => 'Jordan',
    'KZ' => 'Kazakhstan',
    'KE' => 'Kenya',
    'KI' => 'Kiribati',
    'KR' => 'Korea',
    'KW' => 'Kuwait',
    'KG' => 'Kyrgyzstan',
    'LA' => 'Lao People\'s Democratic Republic',
    'LV' => 'Latvia',
    'LB' => 'Lebanon',
    'LS' => 'Lesotho',
    'LR' => 'Liberia',
    'LY' => 'Libyan Arab Jamahiriya',
    'LI' => 'Liechtenstein',
    'LT' => 'Lithuania',
    'LU' => 'Luxembourg',
    'MO' => 'Macao',
    'MK' => 'Macedonia',
    'MG' => 'Madagascar',
    'MW' => 'Malawi',
    'MY' => 'Malaysia',
    'MV' => 'Maldives',
    'ML' => 'Mali',
    'MT' => 'Malta',
    'MH' => 'Marshall Islands',
    'MQ' => 'Martinique',
    'MR' => 'Mauritania',
    'MU' => 'Mauritius',
    'YT' => 'Mayotte',
    'MX' => 'Mexico',
    'FM' => 'Micronesia, Federated States Of',
    'MD' => 'Moldova',
    'MC' => 'Monaco',
    'MN' => 'Mongolia',
    'ME' => 'Montenegro',
    'MS' => 'Montserrat',
    'MA' => 'Morocco',
    'MZ' => 'Mozambique',
    'MM' => 'Myanmar',
    'NA' => 'Namibia',
    'NR' => 'Nauru',
    'NP' => 'Nepal',
    'NL' => 'Netherlands',
    'AN' => 'Netherlands Antilles',
    'NC' => 'New Caledonia',
    'NZ' => 'New Zealand',
    'NI' => 'Nicaragua',
    'NE' => 'Niger',
    'NG' => 'Nigeria',
    'NU' => 'Niue',
    'NF' => 'Norfolk Island',
    'MP' => 'Northern Mariana Islands',
    'NO' => 'Norway',
    'OM' => 'Oman',
    'PK' => 'Pakistan',
    'PW' => 'Palau',
    'PS' => 'Palestinian Territory, Occupied',
    'PA' => 'Panama',
    'PG' => 'Papua New Guinea',
    'PY' => 'Paraguay',
    'PE' => 'Peru',
    'PH' => 'Philippines',
    'PN' => 'Pitcairn',
    'PL' => 'Poland',
    'PT' => 'Portugal',
    'PR' => 'Puerto Rico',
    'QA' => 'Qatar',
    'RE' => 'Reunion',
    'RO' => 'Romania',
    'RU' => 'Russian Federation',
    'RW' => 'Rwanda',
    'BL' => 'Saint Barthelemy',
    'SH' => 'Saint Helena',
    'KN' => 'Saint Kitts And Nevis',
    'LC' => 'Saint Lucia',
    'MF' => 'Saint Martin',
    'PM' => 'Saint Pierre And Miquelon',
    'VC' => 'Saint Vincent And Grenadines',
    'WS' => 'Samoa',
    'SM' => 'San Marino',
    'ST' => 'Sao Tome And Principe',
    'SA' => 'Saudi Arabia',
    'SN' => 'Senegal',
    'RS' => 'Serbia',
    'SC' => 'Seychelles',
    'SL' => 'Sierra Leone',
    'SG' => 'Singapore',
    'SK' => 'Slovakia',
    'SI' => 'Slovenia',
    'SB' => 'Solomon Islands',
    'SO' => 'Somalia',
    'ZA' => 'South Africa',
    'GS' => 'South Georgia And Sandwich Isl.',
    'ES' => 'Spain',
    'LK' => 'Sri Lanka',
    'SD' => 'Sudan',
    'SR' => 'Suriname',
    'SJ' => 'Svalbard And Jan Mayen',
    'SZ' => 'Swaziland',
    'SE' => 'Sweden',
    'CH' => 'Switzerland',
    'SY' => 'Syrian Arab Republic',
    'TW' => 'Taiwan',
    'TJ' => 'Tajikistan',
    'TZ' => 'Tanzania',
    'TH' => 'Thailand',
    'TL' => 'Timor-Leste',
    'TG' => 'Togo',
    'TK' => 'Tokelau',
    'TO' => 'Tonga',
    'TT' => 'Trinidad And Tobago',
    'TN' => 'Tunisia',
    'TR' => 'Turkey',
    'TM' => 'Turkmenistan',
    'TC' => 'Turks And Caicos Islands',
    'TV' => 'Tuvalu',
    'UG' => 'Uganda',
    'UA' => 'Ukraine',
    'AE' => 'United Arab Emirates',
    'GB' => 'United Kingdom',
    'US' => 'United States',
    'UM' => 'United States Outlying Islands',
    'UY' => 'Uruguay',
    'UZ' => 'Uzbekistan',
    'VU' => 'Vanuatu',
    'VE' => 'Venezuela',
    'VN' => 'Viet Nam',
    'VG' => 'Virgin Islands, British',
    'VI' => 'Virgin Islands, U.S.',
    'WF' => 'Wallis And Futuna',
    'EH' => 'Western Sahara',
    'YE' => 'Yemen',
    'ZM' => 'Zambia',
    'ZW' => 'Zimbabwe'
  }.each{ |code, name| Country.create(code: code, name: name) }
end

if State.all.count == 0
  india = Country.find_by_name('India')

  indian_states  = {
   'AP' => 'Andhra Pradesh',
   'AR' => 'Arunachal Pradesh',
   'AS' => 'Assam',
   'BR' => 'Bihar',
   'CT' => 'Chhattisgarh',
   'GA' => 'Goa',
   'GJ' => 'Gujarat',
   'HR' => 'Haryana',
   'HP' => 'Himachal Pradesh',
   'JK' => 'Jammu & Kashmir',
   'JH' => 'Jharkhand',
   'KA' => 'Karnataka',
   'KL' => 'Kerala',
   'MP' => 'Madhya Pradesh',
   'MH' => 'Maharashtra',
   'MN' => 'Manipur',
   'ML' => 'Meghalaya',
   'MZ' => 'Mizoram',
   'NL' => 'Nagaland',
   'OR' => 'Odisha',
   'PB' => 'Punjab',
   'RJ' => 'Rajasthan',
   'SK' => 'Sikkim',
   'TN' => 'Tamil Nadu',
   'TR' => 'Tripura',
   'UK' => 'Uttarakhand',
   'UP' => 'Uttar Pradesh',
   'WB' => 'West Bengal',
   'AN' => 'Andaman & Nicobar',
   'CH' => 'Chandigarh',
   'DN' => 'Dadra and Nagar Haveli',
   'DD' => 'Daman & Diu',
   'DL' => 'Delhi',
   'LD' => 'Lakshadweep',
   'PY' => 'Puducherry',
 }.each{ |code, name| State.create(code: code, name: name, country_id: india.id) }
end

if District.all.count == 0
  kerala = State.find_by_name('Kerala')
  kerala_districts = {
    'AL' => 'Alappuzha',
    'ER' => 'Ernakulam',
    'ID' => 'Idukki',
    'KN' => 'Kannur',
    'KS' => 'Kasaragod',
    'KL' => 'Kollam',
    'KT' => 'Kottayam',
    'KZ' => 'Kozhikode',
    'MA' => 'Malappuram',
    'PL' => 'Palakkad',
    'PT' => 'Pathanamthitta',
    'TV' => 'Thiruvananthapuram',
    'TS' => 'Thrissur',
    'WS' => 'Wayanad'
  }.each{ |code, name| District.create(code: code, name: name, state_id: kerala.id) }
end

if Qualification.all.count == 0
  # Qualifications
  qualifications = ['SSLC', 'PreDegree / +2', 'Graduate', 'Post Graduate',
    'Doctorate', 'Primary'].each { |name| Qualification.create(name: name) }
end

if Occupation.all.count == 0
  # Occupation
  occupations = ['Teacher', 'Engineer', 'Doctor', 'Farmer', 'Daily Wages',
  'Software Professional', 'Bank Officer', 'Manager', 'Govt Employee',
  'Driver', 'Business Man', 'Tailor', 'Carpenter', 'Painter', 'Retired',
  'Other'].each { |occupation| Occupation.create(name: occupation) }
end

if Board.all.count == 0
  # Boards, their streams and corresponding subjects

  # HSE Kerala Board
  board = {name: 'HSE Kerala', subject_structure: '1, 1, 4'}
  board_combinations = {
    'Science' => [
      ['ENGLISH'],
      ['COMPUTER INFORMATION TECHNOLOGY', 'ARABIC', 'FRENCH', 'GERMAN', 'HINDI', 'KANNADA',
        'LATIN', 'MALAYALAM ', 'RUSSIAN', 'SANSKRIT', 'SYRIAC', 'TAMIL', 'URUDU'],
      ['BIOLOGY', 'CHEMISTRY', 'COMPUTER SCIENCE', 'ELECTRONICS', 'GEOLOGY', 'HOME SCIENCE',
        'MATHEMATICS', 'PHYSICS', 'PSHYCHOLOGY', 'STATISTICS']
    ],
    'Humanities' => [
      ['ENGLISH'],
      ['COMPUTER INFORMATION TECHNOLOGY', 'ARABIC', 'FRENCH', 'GERMAN', 'HINDI', 'KANNADA',
        'LATIN', 'MALAYALAM ', 'RUSSIAN', 'SANSKRIT', 'SYRIAC', 'TAMIL', 'URUDU'],
      ['ANTHROPOLOGY', 'ARABIC', 'COMMUNICATIVE ENGLISH', 'COMPUTER APPLICATION', 'ECONOMICS',
        'ENGLISH LITERATURE', 'GANDHIAN STUDIES', 'GEOGRAPHY', 'GEOLOGY', 'HINDI', 'HISTORY',
        'ISLAMIC HISTORY', 'JOURNALISM', 'KANNADA', 'MALAYALAM', 'MUSIC', 'PHILOSOPHY',
        'POLITICS', 'PSHYCHOLOGY', 'SANSKRIT SAHITYA', 'SANSKRIT SASTHRA',
        'SOCIAL WORK', 'SOCIOLOGY', 'STATISTICS', 'TAMIL', 'URDU']
    ],
    'Commerce' => [
      ['ENGLISH'],
      ['COMPUTER INFORMATION TECHNOLOGY', 'ARABIC', 'FRENCH', 'GERMAN', 'HINDI', 'KANNADA',
        'LATIN', 'MALAYALAM ', 'RUSSIAN', 'SANSKRIT', 'SYRIAC', 'TAMIL', 'URUDU'],
      ['ACCOUNTANCY', 'BUSINESS STUDIES', 'COMPUTER APPLICATION', 'ECONOMICS', 'MATHS',
        'POLITICS', 'STATISTICS']
    ]
  }

  @board = Board.new(name: board[:name], subject_structure: board[:subject_structure])
  board_combinations.each do |stream, parts|
    @stream = Stream.new(board: @board, name: stream)
    @stream.save
    parts.each_with_index do |part, count|
      part.each do |subject|
        StreamSubject.new(stream: @stream, name: subject, part: count+1, max_marks: 200).save
      end
    end
  end

  # VHSE Kerala Board
  board = {name: 'VHSE Kerala', subject_structure: '1, 1, 1, 3, 1'}
  board_combinations = {
    'Science' => [
      ['ENGLISH'],
      ['GFC'],
      ['AGRICULTURE', 'ALLIED HEALTH CARE', 'ANIMAL HUSBANDRY', 'BUSINESS & COMMERCE', 'ENGINEERING', 'FISHERIES', 'HOME SCIENCE',
        'HUMANITIES'],
      ['BIOLOGY', 'CHEMISTRY', 'PHYSICS'],
      ['NONE', 'MATHEMATICS']
    ],
    'Humanities' => [
      ['ENGLISH'],
      ['GFC'],
      ['AGRICULTURE', 'ALLIED HEALTH CARE', 'ANIMAL HUSBANDRY', 'BUSINESS & COMMERCE', 'ENGINEERING', 'FISHERIES', 'HOME SCIENCE',
        'HUMANITIES'],
      ['ECONOMICS', 'GEOGRAPHY', 'HISTORY']
    ],
    'Commerce' => [
      ['ENGLISH'],
      ['GFC'],
      ['AGRICULTURE', 'ALLIED HEALTH CARE', 'ANIMAL HUSBANDRY', 'BUSINESS & COMMERCE', 'ENGINEERING', 'FISHERIES', 'HOME SCIENCE',
        'HUMANITIES'],
      ['ACCOUNTANCY WITH AFS', 'ACCOUNTANCY WITH CA', 'BUSINESS STUDIES', 'MANAGEMENT']
    ]
  }

  @board = Board.new(name: board[:name], subject_structure: board[:subject_structure])
  board_combinations.each do |stream, parts|
    @stream = Stream.new(board: @board, name: stream)
    @stream.save
    parts.each_with_index do |part, count|
      part.each do |subject|
        StreamSubject.new(stream: @stream, name: subject, part: count+1, max_marks: 200).save
      end
    end
  end

  # CBSE Board
  board = {name: 'CBSE', subject_structure: '1, 1, 3, 1'}
  board_combinations = {
    'Science' => [
      ['ENGLISH'],
      ['NONE', 'ARABIC', 'FRENCH', 'GERMAN', 'HINDI', 'KANNADA', 'LATIN', 'MALAYALAM ', 'RUSSIAN', 'SANSKRIT', 'SYRIAC', 'TAMIL', 'URUDU'],
      ['AGRICULTURE', 'BIOLOGY', 'BIOTECHNOLOGY', 'CHEMISTRY', 'COMPUTER SCIENCE', 'ENGINEERING GRAPHICS', 'HOME SCIENCE',
        'INFORMATICS PRACTICES', 'MATHEMATICS', 'MULTIMEDIA AND WEB TECHNOLOGY', 'PHYSICS'],
      ['NONE', 'AGRICULTURE', 'BIOLOGY', 'BIOTECHNOLOGY', 'CHEMISTRY', 'COMPUTER SCIENCE', 'ENGINEERING GRAPHICS', 'HOME SCIENCE',
        'INFORMATICS PRACTICES', 'MATHEMATICS', 'MULTIMEDIA AND WEB TECHNOLOGY', 'PHYSICS']

    ],
    'Humanities' => [
      ['ENGLISH'],
      ['NONE', 'ARABIC', 'FRENCH', 'GERMAN', 'HINDI', 'KANNADA', 'LATIN', 'MALAYALAM ', 'RUSSIAN', 'SANSKRIT', 'SYRIAC', 'TAMIL', 'URUDU'],
      ['CREATIVE WRITING AND TRANSLATION STUDIES', 'ECONOMICS', 'FASHION STUDIES', 'FINE ARTS', 'GEOGRAPHY', 'GRAPHIC DESIGN',
        'HERITAGE CRAFTS', 'HISTORY', 'HUMAN RIGHTS AND GENDER STUDIES', 'LEGAL STUDIES',
        'MASS MEDIA STUDIES AND KNOWLEDGE TRADITIONS AND PRACTICES OF INDIA', 'MUSIC AND DANCE', 'PHILOSOPHY',
        'PHYSICAL EDUCATION', 'POLITICAL SCIENCE', 'PSYCHOLOGY', 'SOCIOLOGY'],
      ['NONE', 'CREATIVE WRITING AND TRANSLATION STUDIES', 'ECONOMICS', 'FASHION STUDIES', 'FINE ARTS', 'GEOGRAPHY', 'GRAPHIC DESIGN',
        'HERITAGE CRAFTS', 'HISTORY', 'HUMAN RIGHTS AND GENDER STUDIES', 'LEGAL STUDIES',
        'MASS MEDIA STUDIES AND KNOWLEDGE TRADITIONS AND PRACTICES OF INDIA', 'MUSIC AND DANCE', 'PHILOSOPHY',
        'PHYSICAL EDUCATION', 'POLITICAL SCIENCE', 'PSYCHOLOGY', 'SOCIOLOGY']


    ],
    'Commerce' => [
      ['ENGLISH'],
      ['NONE', 'ARABIC', 'FRENCH', 'GERMAN', 'HINDI', 'KANNADA', 'LATIN', 'MALAYALAM ', 'RUSSIAN', 'SANSKRIT', 'SYRIAC', 'TAMIL', 'URUDU'],
      ['ACCOUNTANCY', 'BUSINESS STUDIES', 'COMPUTER SCIENCE', 'ENTREPRENEURSHIP', 'INFORMATICS PRACTICES'],
      ['NONE','ACCOUNTANCY', 'BUSINESS STUDIES', 'COMPUTER SCIENCE', 'ENTREPRENEURSHIP', 'INFORMATICS PRACTICES']
    ]
  }

  @board = Board.new(name: board[:name], subject_structure: board[:subject_structure])
  board_combinations.each do |stream, parts|
    @stream = Stream.new(board: @board, name: stream)
    @stream.save
    parts.each_with_index do |part, count|
      part.each do |subject|
        max_mark = subject=='NONE' ? 0 : 100
        StreamSubject.new(stream: @stream, name: subject, part: count+1, max_marks: max_mark).save
      end
    end
  end

  # ICS Board
  board = {name: 'ICS', subject_structure: '1, 1, 3, 2'}
  board_combinations = {
    'Science' => [
      ['ENGLISH'],
      ['NONE', 'ARABIC', 'FRENCH', 'GERMAN', 'HINDI', 'KANNADA', 'LATIN', 'MALAYALAM ', 'RUSSIAN', 'SANSKRIT', 'SYRIAC', 'TAMIL', 'URUDU'],
      ['BIOLOGY', 'BIOTECHNOLOGY', 'CHEMISTRY', 'COMPUTER SCIENCE', 'ELECTRICITY & ELECTRONICS', 'ENGINEERING SCIENCE', 'ENVIRONMENTAL SCIENCE',
        'GEOLOGY', 'HOME SCIENCE', 'MATHEMATICS', 'PHYSICS', 'PSHYCHOLOGY', 'STATISTICS'],
      ['NONE', 'ACCOUNTS', 'ART MUSIC (INDIAN OR WESTERN)', 'BUSINESS STUDIES', 'COMMERCE', 'ECONOMICS',
        'ELECTIVE ENGLISH', 'FASHION DESIGNING', 'GEOGRAPHY', 'GEOMETRICAL & BUILDING DRAWING', 'GEOMETRICAL & MECHANICAL DRAWING', 'HISTORY',
        'PHYSICAL EDUCATION', 'POLITICAL SCIENCE', 'PSYCHOLOGY', 'SOCIOLOGY']
    ],
    'Humanities' => [
      ['ENGLISH'],
      ['NONE', 'ARABIC', 'FRENCH', 'GERMAN', 'HINDI', 'KANNADA', 'LATIN', 'MALAYALAM ', 'RUSSIAN', 'SANSKRIT', 'SYRIAC', 'TAMIL', 'URUDU'],
      ['COMMUNICATIVE ENGLISH', 'ECONOMICS', 'ENGLISH LITERATURE', 'GANDHIAN STUDIES', 'GEOGRAPHY', 'GEOLOGY', 'HISTORY',
        'ISLAMIC HISTORY', 'JOURNALISM', 'MUSIC', 'PHILOSOPHY', 'POLITICS', 'PSHYCHOLOGY', 'SANSKRIT SAHITYA', 'SANSKRIT SASTHRA',
        'SOCIAL WORK', 'SOCIOLOGY', 'STATISTICS'],
      ['NONE','ACCOUNTS', 'ART MUSIC (INDIAN OR WESTERN)', 'BIOLOGY', 'BIOTECHNOLOGY', 'BUSINESS STUDIES', 'CHEMISTRY',
        'COMMERCE', 'COMPUTER SCIENCE', 'ECONOMICS', 'ELECTIVE ENGLISH', 'ELECTRICITY & ELECTRONICS', 'ENGINEERING SCIENCE',
        'ENVIRONMENTAL SCIENCE', 'FASHION DESIGNING', 'GEOGRAPHY', 'GEOMETRICAL & BUILDING DRAWING', 'GEOMETRICAL & MECHANICAL DRAWING',
        'HISTORY', 'HOME SCIENCE', 'MATHEMATICS', 'PHYSICAL EDUCATION', 'PHYSICS', 'POLITICAL SCIENCE', 'PSYCHOLOGY', 'SOCIOLOGY']
    ],
    'Commerce' => [
      ['ENGLISH'],
      ['NONE', 'ARABIC', 'FRENCH', 'GERMAN', 'HINDI', 'KANNADA', 'LATIN', 'MALAYALAM ', 'RUSSIAN', 'SANSKRIT', 'SYRIAC', 'TAMIL', 'URUDU'],
      ['ACCOUNTS', 'BUSINESS STUDIES', 'COMMERCE', 'ECONOMICS', 'MATHEMATICS', 'POLITICAL SCIENCE'],
      ['NONE','ART MUSIC (INDIAN OR WESTERN)', 'BIOLOGY', 'BIOTECHNOLOGY', 'CHEMISTRY', 'COMPUTER SCIENCE', 'ELECTIVE ENGLISH',
        'ELECTRICITY & ELECTRONICS', 'ENGINEERING SCIENCE', 'ENVIRONMENTAL SCIENCE', 'FASHION DESIGNING', 'GEOGRAPHY',
        'GEOMETRICAL & BUILDING DRAWING', 'GEOMETRICAL & MECHANICAL DRAWING', 'HISTORY', 'HOME SCIENCE', 'PHYSICAL EDUCATION',
        'PHYSICS', 'PSYCHOLOGY', 'SOCIOLOGY'],
    ]
  }

  @board = Board.new(name: board[:name], subject_structure: board[:subject_structure])
  board_combinations.each do |stream, parts|
    @stream = Stream.new(board: @board, name: stream)
    @stream.save
    parts.each_with_index do |part, count|
      part.each do |subject|
        max_mark = subject=='NONE' ? 0 : 100
        StreamSubject.new(stream: @stream, name: subject, part: count+1, max_marks: max_mark).save
      end
    end
  end

  # HSE Tamilnadu Board
  board = {name: 'HSE Tamilnadu', subject_structure: '1, 1, 4'}
  board_combinations = {
    'Science' => [
      ['ENGLISH'],
      ['COMPUTER INFORMATION TECHNOLOGY', 'ARABIC', 'FRENCH', 'GERMAN', 'HINDI', 'KANNADA',
        'LATIN', 'MALAYALAM ', 'RUSSIAN', 'SANSKRIT', 'SYRIAC', 'TAMIL', 'URUDU'],
      ['BIOLOGY', 'CHEMISTRY', 'COMPUTER SCIENCE', 'ELECTRONICS', 'GEOLOGY', 'HOME SCIENCE',
        'MATHEMATICS', 'PHYSICS', 'PSHYCHOLOGY', 'STATISTICS']
    ],
    'Humanities' => [
      ['ENGLISH'],
      ['COMPUTER INFORMATION TECHNOLOGY', 'ARABIC', 'FRENCH', 'GERMAN', 'HINDI', 'KANNADA',
        'LATIN', 'MALAYALAM ', 'RUSSIAN', 'SANSKRIT', 'SYRIAC', 'TAMIL', 'URUDU'],
      ['ANTHROPOLOGY', 'ARABIC', 'COMMUNICATIVE ENGLISH', 'COMPUTER APPLICATION', 'ECONOMICS',
        'ENGLISH LITERATURE', 'GANDHIAN STUDIES', 'GEOGRAPHY', 'GEOLOGY', 'HINDI', 'HISTORY',
        'ISLAMIC HISTORY', 'JOURNALISM', 'KANNADA', 'MALAYALAM', 'MUSIC', 'PHILOSOPHY',
        'POLITICS', 'PSHYCHOLOGY', 'SANSKRIT SAHITYA', 'SANSKRIT SASTHRA',
        'SOCIAL WORK', 'SOCIOLOGY', 'STATISTICS', 'TAMIL', 'URDU']
    ],
    'Commerce' => [
      ['ENGLISH'],
      ['COMPUTER INFORMATION TECHNOLOGY', 'ARABIC', 'FRENCH', 'GERMAN', 'HINDI', 'KANNADA',
        'LATIN', 'MALAYALAM ', 'RUSSIAN', 'SANSKRIT', 'SYRIAC', 'TAMIL', 'URUDU'],
      ['ACCOUNTANCY', 'BUSINESS STUDIES', 'COMPUTER APPLICATION', 'ECONOMICS', 'MATHS',
        'POLITICS', 'STATISTICS']
      ]
    }

  @board = Board.new(name: board[:name], subject_structure: board[:subject_structure])
  board_combinations.each do |stream, parts|
    @stream = Stream.new(board: @board, name: stream)
    @stream.save
    parts.each_with_index do |part, count|
      part.each do |subject|
        StreamSubject.new(stream: @stream, name: subject, part: count+1, max_marks: 200).save
      end
    end
  end

  # NIOS Board
  board = {name: 'NIOS', subject_structure: '1, 1, 3, 3'}
  board_combinations = {
    'Science' => [
      ['ENGLISH'],
      ['NONE', 'BENGALI', 'HINDI', 'ODIYA','SANSKRIT', 'TAMIL', 'URUDU'],
      ['BIOLOGY', 'CHEMISTRY', 'COMPUTER SCIENCE', 'ENVIRONMENTAL SCIENCE', 'MATHEMATICS', 'PHYSICS', 'PSYCHOLOGY'],
      ['NONE', 'ACCOUNTANCY', 'COMMERCE', 'COMPUTER SCIENCE', 'DATA ENTRY OPERATIONS', 'ECONOMICS', 'ENVIRONMENTAL SCIENCE',
        'GEOGRAPHY', 'HISTORY', 'HOME SCIENCE', 'MASS COMMUNICATION', 'MATHEMATICS', 'PAINTING', 'POLITICAL SCIENCE',
        'PSYCHOLOGY', 'SOCIOLOGY']
    ],
    'Humanities' => [
      ['ENGLISH'],
      ['NONE', 'BENGALI', 'HINDI', 'ODIYA','SANSKRIT', 'TAMIL', 'URUDU'],
      ['ECONOMICS', 'ENVIRONMENTAL SCIENCE', 'GEOGRAPHY', 'HISTORY', 'HOME SCIENCE', 'MASS COMMUNICATION', 'POLITICAL SCIENCE',
        'PSYCHOLOGY', 'SOCIOLOGY'],
      ['NONE', 'ACCOUNTANCY', 'COMMERCE', 'COMPUTER SCIENCE', 'DATA ENTRY OPERATIONS', 'ECONOMICS', 'ENVIRONMENTAL SCIENCE',
        'GEOGRAPHY', 'HISTORY', 'HOME SCIENCE', 'MASS COMMUNICATION', 'MATHEMATICS', 'PAINTING', 'POLITICAL SCIENCE',
        'PSYCHOLOGY', 'SOCIOLOGY']
    ],
    'Commerce' => [
      ['ENGLISH'],
      ['NONE', 'BENGALI', 'HINDI', 'ODIYA','SANSKRIT', 'TAMIL', 'URUDU'],
      ['ACCOUNTANCY', 'COMMERCE', 'COMPUTER SCIENCE', 'HOME SCIENCE', 'MASS COMMUNICATION'],
      ['NONE', 'ACCOUNTANCY', 'COMMERCE', 'COMPUTER SCIENCE', 'DATA ENTRY OPERATIONS', 'ECONOMICS', 'ENVIRONMENTAL SCIENCE',
        'GEOGRAPHY', 'HISTORY', 'HOME SCIENCE', 'MASS COMMUNICATION', 'MATHEMATICS', 'PAINTING', 'POLITICAL SCIENCE',
        'PSYCHOLOGY', 'SOCIOLOGY']
    ]
  }

  @board = Board.new(name: board[:name], subject_structure: board[:subject_structure])
  board_combinations.each do |stream, parts|
    @stream = Stream.new(board: @board, name: stream)
    @stream.save
    parts.each_with_index do |part, count|
      part.each do |subject|
        max_mark = subject=='NONE' ? 0 : 100
        StreamSubject.new(stream: @stream, name: subject, part: count+1, max_marks: max_mark).save
      end
    end
  end
end

if Programme.all.count == 0
  # Programmes List
  programmes = ['B.A. Arabic & Islamic History (Double Main)',
    'B.A. Economics with Indian History & Political Science',
    'B.A. English literature with Journalism & Public Relations',
    'B.A. Mass Communication (Self-Financing)',
    'B.A. History with Economics & Political Science',
    'B.Sc. Chemistry with Mathematics & Physics',
    'B.Sc. Mathematics with Statistics & Physics',
    'B.Sc. Physics with Mathematics & Computer Applications',
    'B.Sc. Zoology with Botany & Chemistry', 'B.Sc. Food Technology with Chemistry & Physics',
    'B.Com with Co-operation', 'B.Com. with Computer Application', 'BBA'
  ]

  programmes.each { |programme| Programme.new(name: programme, programme_type:'ug').save }
end
