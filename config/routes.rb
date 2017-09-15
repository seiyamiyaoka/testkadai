Rails.application.routes.draw do
  
  get '/', to:'tops#top'
  resources:blogs
end
