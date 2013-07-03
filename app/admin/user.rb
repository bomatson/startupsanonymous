ActiveAdmin.register User do
  menu parent: "Management"

  filter :email

  scope :all, default: true

  scope :listener do |user|
    user.where(role: 'listener')
  end

  scope :anonymous do |user|
    user.where(anonymous: true)
  end

  index do
    column :id
    column :email
    column :skype
    column :timeslots do |user|
      user.schedule.timeslots.map{|tag| tag.formatted_start_time}.join(", ")
    end
    column :anonymous
    default_actions
  end

  form do |f|
    f.inputs 'Details' do
      f.input :email
      f.input :role
      f.input :skype
      f.input :anonymous
      f.input :password
    end
    f.actions
  end

  show do |f|
    attributes_table do
      row :email
      row :role
      row :skype
      row :offered_timeslots do |user|
        user.timeslots.map{|t| t.formatted_start_time}.join(", ")
      end
      row :requested_timeslots do |user|
        Timeslot.where('requester_id = ?', user.id).map{|t| t.formatted_start_time }.join(',')
      end
    end
  end

end