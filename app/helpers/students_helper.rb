module StudentsHelper
  def semester_attendance(semester, attendances)
    present = attendances.select &:present
    percent = (present.size/attendances.size.to_f * 100).round rescue 0
    link_to course_semester_path(semester.course_id, semester), class: 'attendance', style: "width: #{percent}%" do
      <<-HTML.html_safe
        <span>#{semester.course.name} | #{semester.name}</span>
        <span>#{percent}%</span>
      HTML
    end
  end

  # def student_attendance(student)
  #   total = student.attendances.select { |x| x.semester_id == @semester.id }
  #   present = total.select &:present
  #   percent = (present.size/total.size.to_f * 100).round rescue 0
  #   link_to student, class: 'attendance', style: "width: #{percent}%" do
  #     <<-HTML.html_safe
  #       <span>#{student.first_name}</span>
  #       <span>#{percent}%</span>
  #     HTML
  #   end
  # end

  def student_attendance(student, attendances)
    total = attendances.select { |x| x.student_id == student.id }
    present = total.select &:present
    percent = (present.size/total.size.to_f * 100).round rescue 0
    link_to student, class: 'attendance', style: "width: #{percent}%" do
      <<~HTML.html_safe
        <span>#{student.first_name}</span>
        <span>#{percent}%</span>
      HTML
    end
  end

  def student_info(student, name)
    <<~HTML.html_safe
      <h4 class="card-title">#{name.to_s.titleize}</h4>

      <p class="card">#{@student.send(name) || '<i>missing</i>'}</p>
    HTML
  end
end
