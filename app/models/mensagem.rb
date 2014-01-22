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

  def aprovada?
    self.aprovada == true
  end

  def aprovar
    self.aprovada = true
  end

  def desaprovar
    self.aprovada = false
  end
end
