# == Schema Information
#
# Table name: presentes
#
#  id         :integer          not null, primary key
#  nome       :string(255)
#  valor      :decimal(17, 2)
#  foto       :string(255)
#  url        :text
#  lista_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Presente < ActiveRecord::Base
  belongs_to :lista
  has_many :mensagens
end
