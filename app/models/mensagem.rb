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
    self.aprovada == TRUE
  end

  def aprovar
    self.aprovada = TRUE
  end

  def desaprovar
    self.aprovada = FALSE
  end
end
