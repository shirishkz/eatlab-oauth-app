# Initial Data for Role
@admin = Role.create(name: "Admin")
@member = Role.create(name: "Member")
# Admin
User.create(email: "admin@test.com",
            password: "admin123",
            password_confirmation: "admin123",
            role: @admin)
