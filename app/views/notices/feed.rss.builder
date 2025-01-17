xml.instruct! :xml, version: '1.0'
xml.rss version: '2.0' do
  xml.channel do
    xml.title Translation.t('rss_recent_notices_title')
    xml.author Translation.t('rss_recent_notices_author')
    xml.description Translation.t('rss_recent_notices_description')
    xml.link 'https://www.lumendatabase.org/'
    xml.language 'en'

    @recent_notices.each do |notice|
      xml.item do
        if notice.title
          xml.title notice.title
        else
          xml.title ''
        end
        xml.author notice.sender_name
        xml.pubDate notice.created_at.to_s(:rfc822)
        xml.link "https://www.lumendatabase.org/notices/#{notice.id}"
        xml.guid notice.id
        xml.type notice.type

        xml.description "<p> To: #{notice.recipient_name}\nFrom: #{notice.sender_name}\n#{notice.body}</p>"
      end
    end
  end
end
