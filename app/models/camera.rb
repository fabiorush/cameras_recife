class Camera < ApplicationRecord
  has_many :user_cameras
  has_many :users, through: :user_cameras

  def url
    "http://transito.gtrans.com.br/cttupe/index.php/portal/getImg/" + ip
  end

  def self.download_camera_list
    Net::HTTP.get("transito.gtrans.com.br","/cttupe/index.php/mapa").split("\n").map do |str|
      match = str.match(/criaPonto\((.+) +,(.+) +,'(.+)',.+span style.+\/b>(.+)<\//)
      if match.nil?
        nil
      else
        cap = match.captures
        [[:latitude, cap[0]], [:longitude, cap[1]], [:ip, cap[2]], [:name, cap[3].force_encoding("utf-8")]].to_h
      end
    end.select { |x| x }
  end

  def self.populate_database
    destroy_all
    download_camera_list.each do |camera|
      create(camera)
    end
  end
end
