Bundler.require

get '/' do
  doc = Nokogiri::HTML(HTTParty.post('http://9.dee.cc/~hakase2/tokuken.php', body: params))
  div = doc.xpath('//div[3]')
  mid = div.css('.midcs')
  hat = div.css('.hatcs')
  yak = div.css('.yakcs')
  yor = div.css('.yorcs')
  list = []
  mid.each_with_index do |x, i|
    list << {
      mid: mid[i].text.gsub(/\r/, ''),
      hat: hat[i].text.gsub(/\r/, ''),
      yak: yak[i].text.gsub(/\r/, ''),
      yor: yor[i].text.gsub(/\r/, '')
    }
  end
  list.to_json
end
