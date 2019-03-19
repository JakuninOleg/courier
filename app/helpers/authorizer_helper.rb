module AuthorizerHelper
  def meeting_confirmed
    @applications.where(status_id: 4)
  end

  def verificated
    @applications.where(status_id: 6)
  end

  def check_photo
    @applications.where(status_id: 8)
  end

  def attach_card
    @applications.where(status_id: 11)
  end

  def postpone
    @applications.where(status_id: 13)
  end
end
