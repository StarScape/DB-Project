json.extract! student, :id, :bannerID, :fname, :lname, :pname, :email, :created_at, :updated_at
json.url student_url(student, format: :json)
