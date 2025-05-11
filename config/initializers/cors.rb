Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins ENV["ALLOWED_ORIGINS"] || "http://localhost:4200"

    resource "*",
      headers: :any,
      methods: [ :get, :post, :put, :patch, :delete, :options, :head ],
      expose: [ "Authorization" ]
  end
end
