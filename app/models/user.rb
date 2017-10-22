class User < ApplicationRecord
    
attr_writer :current_step    
def self.get_countries
CS.get
end

    
 COUNTRY_LIST = ["Afghanistan","Albania","Algeria","Andorra","Angola","Anguilla","Antigua &amp; Barbuda","Argentina","Armenia","Aruba","Australia","Austria","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bermuda","Bhutan","Bolivia","Bosnia &amp; Herzegovina","Botswana","Brazil","British Virgin Islands","Brunei","Bulgaria","Burkina Faso","Burundi","Cambodia","Cameroon","Cape Verde","Cayman Islands","Chad","Chile","China","Colombia","Congo","Cook Islands","Costa Rica","Cote D Ivoire","Croatia","Cruise Ship","Cuba","Cyprus","Czech Republic","Denmark","Djibouti","Dominica","Dominican Republic","Ecuador","Egypt","El Salvador","Equatorial Guinea","Estonia","Ethiopia","Falkland Islands","Faroe Islands","Fiji","Finland","France","French Polynesia","French West Indies","Gabon","Gambia","Georgia","Germany","Ghana","Gibraltar","Greece","Greenland","Grenada","Guam","Guatemala","Guernsey","Guinea","Guinea Bissau","Guyana","Haiti","Honduras","Hong Kong","Hungary","Iceland","India","Indonesia","Iran","Iraq","Ireland","Isle of Man","Israel","Italy","Jamaica","Japan","Jersey","Jordan","Kazakhstan","Kenya","Kuwait","Kyrgyz Republic","Laos","Latvia","Lebanon","Lesotho","Liberia","Libya","Liechtenstein","Lithuania","Luxembourg","Macau","Macedonia","Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Mauritania","Mauritius","Mexico","Moldova","Monaco","Mongolia","Montenegro","Montserrat","Morocco","Mozambique","Namibia","Nepal","Netherlands","Netherlands Antilles","New Caledonia","New Zealand","Nicaragua","Niger","Nigeria","Norway","Oman","Pakistan","Palestine","Panama","Papua New Guinea","Paraguay","Peru","Philippines","Poland","Portugal","Puerto Rico","Qatar","Reunion","Romania","Russia","Rwanda","Saint Pierre &amp; Miquelon","Samoa","San Marino","Satellite","Saudi Arabia","Senegal","Serbia","Seychelles","Sierra Leone","Singapore","Slovakia","Slovenia","South Africa","South Korea","Spain","Sri Lanka","St Kitts &amp; Nevis","St Lucia","St Vincent","St. Lucia","Sudan","Suriname","Swaziland","Sweden","Switzerland","Syria","Taiwan","Tajikistan","Tanzania","Thailand","Timor L'Este","Togo","Tonga","Trinidad &amp; Tobago","Tunisia","Turkey","Turkmenistan","Turks &amp; Caicos","Uganda","Ukraine","United Arab Emirates","United Kingdom","Uruguay","Uzbekistan","Venezuela","Vietnam","Virgin Islands (US)","Yemen","Zambia","Zimbabwe"]

    
SEX = ["Male" , "Female" , "Other"]
    
#LANGUAGE = ["Arabic" ,"Arunachali" , "Awadhi","Baluchi","Bhojpuri","Brahui","Brij","Burmese","Chattisgarhi","Garhwali","Garo","Haryanavi","Himachali/Pahari","Hindko","Hindi", ,"Kanauji","Kashmiri","Khandesi","Khasi","Koshali","Rajasthani","Magahi","Maithili","Other"]    
    
EDUCATION_OPTION = ["Doctorate","Masters","Honours degree","Bachelors","Undergraduate","Associates degree","Diploma","High school","Less than high school","Trade school"]  
    
EDUCATION_FIELD = ["Advertising/ Marketing","Administrative services","Architecture","Armed Forces","Arts","Commerce","Computers/ IT","Education","Engineering/ Technology","Finance","Fine Arts","Home Science","Law","Management","Medicine","Nursing/ Health Sciences","Office administration","Science","Shipping","Travel &amp; Tourism"]
    
ANNUAL_INCOME=["Upto INR 1 Lakh","INR 1 Lakh to 2 Lakh","INR 2 Lakh to 4 Lakh","INR 4 Lakh to 7 Lakh","INR 7 Lakh to 10 Lakh","INR 10 Lakh to 15 Lakh","INR 15 Lakh to 20 Lakh","INR 20 Lakh to 30 Lakh","INR 30 Lakh to 50 Lakh","INR 50 Lakh to 75 Lakh","INR 75 Lakh to 1 Crore","INR 1 Crore &amp; above"]
    
SKIN_TONE = ["Very Fair","Fair","Wheatish","Dark"]
    
BODY_TYPE = ["Slim","Athletic","Average","Heavy"]    
  
DIET=["Veg","Non-Veg","Occasionally Non-Veg","Eggetarian","Jain","Vegan"]   
    
MARITAL_STATUS = ["Never Married","Divorced","Widowed","Awaiting Divorce","Annulled"]

RASHI =["Mesh(Aries)","Vrishabh (Taurus)","Mithun (Gemini)","Kark (Cancer)","Simha (Leo)","Kanya (Virgo)","Tula (Libra)","Vrishchik (Scorpio)","Dhanu (Sagittarius)","Makar (Capricorn)","Kumbh (Aquarius)","Meen (Pisces)"]


has_secure_password    
    
before_create { generate_token(:auth_token) }

def send_password_reset
  generate_token(:password_reset_token)
  self.password_reset_sent_at = Time.zone.now
  save!
  UserMailer.password_reset(self).deliver
end

def generate_token(column)
  begin
    self[column] = SecureRandom.urlsafe_base64
  end while User.exists?(column => self[column])
end    
    
    def commands=(commands)
    commands.reject(&:blank?)
  end

    
def current_step
  @current_step || steps.first
end

def steps
  %w[register general personal education lifestyle]
end

def next_step
  self.current_step = steps[steps.index(current_step)+1]
end

def previous_step
  self.current_step = steps[steps.index(current_step)-1]
end

def first_step?
  current_step == steps.first
end

def last_step?
  current_step == steps.last
end

def all_valid?
  steps.all? do |step|
    self.current_step = step
    valid?
  end
end    
end
