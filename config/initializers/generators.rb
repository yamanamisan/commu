Rails.application.config.generators do |g|
  #ヘルパー・css,jsファイルを作成しない
   g.helper false
   g.assets false
  #routes.rbを作成しない
   g.skip_routes true
  #テストスクリプトを作成しない
   g.test_framework false
 end
