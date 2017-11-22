class ExampleInput < ApplicationRecord
  @valreceita = 0

  def self.formatoArquivo(file)
    unless file.nil?
      file.content_type.split('/').last == "CSV" || file.content_type.split('/').last == "csv" ? true : false
    end
  end

  def self.import(file)
    unless file.nil?
      @valreceita = 0
      CSV.foreach(file.path , headers: true ) do |row|
        saveInformation(row)
        calcReceita(row[2], row[3])
      end
      saveRevenues(@valreceita, file.original_filename)
    end
  end

  private
  def self.saveInformation(contentLine)
    saveExampleInput(contentLine)
    saveItem( contentLine[1], contentLine[2] )
    savePurchaser( contentLine[0], contentLine[3] )
    saveMerchant(  contentLine[4], contentLine[5] )
  end

  def self.calcReceita(val,qtd)
    @valreceita += val.to_i * qtd.to_i
  end

  def self.saveItem( description, price )
    item = Item.new
      item[:description] = description
      item[:price] = price
    item.save
  end

  def self.savePurchaser( name, count )
    purchasers = Purchaser.new
      purchasers[:name] = name
      purchasers[:count] = count
    purchasers.save
  end

  def self.saveMerchant( address, name)
    merchants = Merchant.new
      merchants[:address] = address
      merchants[:name] = name
    merchants.save
  end

  def self.saveExampleInput(conteudo)
    example = ExampleInput.new
      example[:purchasername] = conteudo[0]
      example[:itemdescription] = conteudo[1]
      example[:itemprice] = conteudo[2]
      example[:purchasecount] = conteudo[3]
      example[:merchantaddress] = conteudo[4]
      example[:merchantname] = conteudo[5]
    example.save
  end

  def self.saveRevenues(val, name)
    revenue = Revenue.new
      revenue[:name] = name
      revenue[:value] = val
    revenue.save
  end

end
