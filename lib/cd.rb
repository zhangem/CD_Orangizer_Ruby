class CD

  @@cd_list =[]

  attr_reader(:band, :album, :year, :genre)

  def initialize(attributes)
    @band = attributes[:band]
    @album = attributes[:album]
    @year = attributes[:year]
    @genre = attributes[:genre]
  end

  def CD.create(attributes)
    new_cd = CD.new(attributes)
    @@cd_list << new_cd
    new_cd
  end

  def CD.all
    @@cd_list
  end

  def CD.clear
    @@cd_list = []
  end

  def CD.search(attribute, query)
    attribute = attribute
    results = []
    CD.all.each do |e|
      if e.send(attribute).downcase == query.downcase
        results << e
      end
    end
    if results.length > 0
      return results
    else
      return false
    end
  end


end
