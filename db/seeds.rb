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

  statuses = %w[applied interview offer rejected withdrawn saved]

  5.times do |i|
    status = statuses.sample
    applied_date = Date.today - rand(1..20).days

    job = user.job_applications.create!(
      title: "Seeded Job #{i + 1}",
      company: "Company #{i}",
      location: ["Remote", "On-site", "Hybrid"].sample,
      source: ["Indeed", "LinkedIn", "Glassdoor", "AngelList"].sample,
      url: "https://example.com/job/#{i + 1}",
      date_applied: applied_date,
      status: status,
      notes: "Notes for job #{i + 1} with status '#{status}'.",
      tags: ["seed", "demo"],
      job_type: ["Full-time", "Part-time", "Contract"].sample,
      job_description: "This is a seeded job description for job ##{i + 1}."
    )

    user.resumes.create!(
      file_url: "https://example.com/resume#{i + 1}.pdf",
      profession: ["Software Developer", "Frontend Engineer", "Backend Developer"].sample,
      job_application: job
    )

    job.create_cover_letter!(
      file_url: "https://example.com/cover_letter#{i + 1}.pdf",
      tone: ["professional", "casual", "enthusiastic"].sample,
      summary: "I'm interested in the role at Company #{i} and bring experience that aligns well."
    )

    job.create_ai_insight!(
      match_score: rand(60..99),
      suggested_skills: ["Ruby on Rails", "Angular", "React", "PostgreSQL", "Docker"].sample(3).join(", "),
      tone_suggestions: ["Be confident", "Show impact", "Be concise", "Tailor to job"].sample(2).join(", ")
    )

    job.create_email_tracking!(
      thread_id: "demo-thread-#{i}",
      last_email_snippet: "We have received your application for #{job.title}.",
      last_updated_from_email: DateTime.now - rand(1..48).hours
    )
  end

  puts "✅ Done seeding for #{user.email}!"
end
