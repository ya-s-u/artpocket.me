module ApplicationHelper
  def default_meta_tags
    {
      site: 'アートポケット',
      separator: '|',
      reverse: true,
      description: '東海のアートイベントのフライヤー紹介サイト',
      keywords: '名古屋, アート, フライヤー',
      canonical: :root,
      og: {
        title: :title,
        type: 'website',
        url: request.original_url,
        image: "http:#{image_url('ogp.png')}",
        site_name: :site,
        description: :description,
        locale: 'ja_JP'
      },
      viewport: 'width=device-width,initial-scale=1.0',
    }
  end
end
