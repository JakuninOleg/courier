module SupervisorHelper
  def applications_to_distribute
    @applications.where(status_id: 1)
  end

  def documents_to_hand_out
    @applications.where(status_id: 2)
  end

  def processing
    @applications.where("status_id BETWEEN ? AND ?", 3, 11)
  end

  def collect_documents
    @applications.where(status_id: 12)
  end
end
