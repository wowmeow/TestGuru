module GistsHelper
  def link_to_gist(gist)
    link_to gist.url.split('/').last, gist.url, target: '_blank', rel: 'noopener'
  end
end
