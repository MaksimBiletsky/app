module DashboardBroadcastable
  extend ActiveSupport::Concern

  included do
    after_create_commit { broadcast_to_dashboard }
    after_destroy_commit { broadcast_to_dashboard }
    after_update_commit { broadcast_to_dashboard }
  end

  def broadcast_to_dashboard
    User.find_each { |user| broadcast_for_replace_dashboard(user) }
    broadcast_for_replace_dashboard(nil)
  end

  def broadcast_for_replace_dashboard(user)
    broadcast_replace_to(user ? "dashboard_#{user.id}" : "dashboard", target: "to_do_lists", partial: "dashboard/to_do_lists",
                                                                      locals: {
                                                                        my_to_do_lists: user ? user.to_do_lists.to_a : [],
                                                                        to_do_lists: user ? ToDoList.where.not(user:).to_a : ToDoList.all.to_a,
                                                                        user:
                                                                      })
  end
end
