class Search < ApplicationRecord

    def search_users
      @users ||= find_users
    end

    private

    def find_users
      users = User.order(:name)
      users = users.where("name like ?", "%#{keywords}%") if keywords.present?
      users = users.where(sex: sex) if sex.present?
      users = users.where("Age >= ?", age_min) if age_min.present?
      users = users.where("Age <= ?", age_max) if age_max.present?
      users = users.where(city: city) if city.present?
      users
    end


end
