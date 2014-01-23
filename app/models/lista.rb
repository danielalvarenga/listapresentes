# == Schema Information
#
# Table name: listas
#
#  id            :integer          not null, primary key
#  nome          :string(255)
#  presenteados  :string(255)
#  descricao     :text
#  foto          :string(255)
#  user_id       :integer
#  created_at    :datetime
#  updated_at    :datetime
#  dt_fechamento :datetime
#  publicada     :boolean
#

class Lista < ActiveRecord::Base
  belongs_to :user
  has_many :presentes

  validates :nome, :presenteados, :user_id, presence: true

  def publica?
    self.publicada == true
  end

  def fechada?
    self.dt_fechamento < Date.today
  end

  def status
    if (self.publica?)
      return "Publicada"
    else
      return "Não Publicada"
    end
  end
end
