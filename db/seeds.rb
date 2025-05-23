if Rails.env.development?
  puts "🌱 Seeding development data..."

  user = User.where("LOWER(email) = ?", "userfinal@example.com").first

  unless user
    user = User.create!(
      email: "userFinal@example.com",
      password: "password123",
      password_confirmation: "password123"
    )
    puts "✅ Created new user: #{user.email}"
  else
    puts "ℹ️  Found existing user: #{user.email}"
  end

  user.job_applications.destroy_all
  user.resumes.destroy_all

  5.times do |i|
    job = user.job_applications.create!(
      title: "Seeded Job #{i + 1}",
      company: "Company #{i}",
      location: "Remote",
      source: "Indeed",
      url: "https://example.com/job/#{i + 1}",
      date_applied: Date.today - i.days,
      status: "applied",
      notes: "Seeded job #{i + 1} notes.",
      tags: ["seed", "demo"],
      job_type: "Full-time",
      job_description: "This is a seeded job description for job ##{i + 1}."
    )

    user.resumes.create!(
      file_url: "https://example.com/resume#{i + 1}.pdf",
      profession: "Software Developer",
      job_application: job
    )

    job.create_cover_letter!(
      file_url: "https://example.com/cover_letter#{i + 1}.pdf",
      tone: "professional",
      summary: "I am very interested in the position at Company #{i} and believe my experience aligns well with the job requirements."
    )

    job.create_ai_insight!(
      match_score: rand(70..99),
      suggested_skills: "Ruby on Rails, Angular, PostgreSQL",
      tone_suggestions: "Be confident, highlight achievements, and keep it concise."
    )

    job.create_email_tracking!(
      thread_id: "demo-thread-#{i}",
      last_email_snippet: "We have received your application.",
      last_updated_from_email: DateTime.now - i.hours
    )
  end

  puts "✅ Done seeding for #{user.email}!"
end

