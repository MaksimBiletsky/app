module DashboardBroadcastable
  extend ActiveSupport::Concern

    included do
      after_create_commit { broadcast_to_dashboard }
      after_destroy_commit { broadcast_to_dashboard }
      after_update_commit { broadcast_to_dashboard }
    end

    def broadcast_to_dashboard
      User.find_each do |user|
        broadcast_replace_to("dashboard_#{user.id}", target: "to_do_lists", partial: "dashboard/to_do_lists",
                                                  locals: {
                                                    my_to_do_lists: user.to_do_lists.to_a,
                                                    to_do_lists: ToDoList.where.not(user:).to_a,
                                                    user: } 
                                                  )
      end
    end
end