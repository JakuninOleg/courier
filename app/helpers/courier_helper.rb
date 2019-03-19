module CourierHelper
  def label_color(status)
    return "teal" if status == 2
    return "teal" if status == 6
    return "green" if status == 3
    return "purple" if status == 4
    return "olive" if status == 5
    return "blue" if status == 7
    return "grey" if status == 8
    return "red" if status == 9
    return "pink" if status == 10
    return "orange" if status == 11
    return "brown" if status == 12
  end
end
