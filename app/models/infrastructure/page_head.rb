# encoding: utf-8
class PageHead
  attr_reader :keywords
  attr_reader :description
  attr_reader :title_complement
  attr_reader :robots

  INDEX_PAGEHEAD = {
    :keywords => "hugolnx,hugo,roque",
    :description => "Um blog de Hugo Roque (a.k.a HugoLnx) que foi criado com a intenção de compartilhar conhecimentos adquiridos durante seus estudos pessoais e profissionais.",
    :robots => 'index',
    :title_complement => 'Index'
  }

  ERROR_PAGEHEAD = {
    :keywords => '',
    :description => '',
    :robots => 'noindex',
    :title_complement => 'Error'
  }

  def initialize(args)
    @keywords = args[:keywords]
    @robots = args[:robots]
    @description = args[:description]
    @title_complement = args[:title_complement]
  end

  class << self
    def of_index
      self.new INDEX_PAGEHEAD
    end

    def of_error
      self.new ERROR_PAGEHEAD
    end
  end
end
