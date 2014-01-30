# == Schema Information
#
# Table name: mensagens
#
#  id          :integer          not null, primary key
#  remetente   :string(255)
#  texto       :text
#  aprovada    :boolean
#  presente_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Mensagem < ActiveRecord::Base
  belongs_to :presente

  validates_presence_of :remetente, :texto
  before_create :desaprovar

  def aprovada?
    self.aprovada == "1"
  end

  def aprovar
    self.aprovada = "1"
  end

  def desaprovar
    self.aprovada = "0"
  end
end
