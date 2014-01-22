# == Schema Information
#
# Table name: listas
#
#  id           :integer          not null, primary key
#  nome         :string(255)
#  presenteados :string(255)
#  descricao    :text
#  foto         :string(255)
#  user_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class Lista < ActiveRecord::Base
  belongs_to :user
  has_many :presentes
end
