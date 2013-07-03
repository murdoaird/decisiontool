module SurveysHelper
  def build_survey (decision)
    String surveyOptions = ""
    #decision.id is the decision.id (confirmed)
    surveyOptions = "<table border=0>" 
    
    countRow = 0
    countX = 0
    for elementX in decision.elements
      countY = 0
      surveyOptions = surveyOptions + "<tr>"
      for elementY in decision.elements
        if elementX.name != elementY.name 
          if countX < countY
            surveyOptions = surveyOptions + "<tr><td>" + elementX.name + "</td>"
            for i in 1..9
              surveyOptions = surveyOptions + "<td><input type='radio' name='opt_" + countRow.to_s + "' value='" + i.to_s + " " + elementX.id.to_s + " " + elementY.id.to_s + "'>" + i.to_s + "<br></td><td>&nbsp;</td>"
            end
            countRow += 1
            surveyOptions = surveyOptions + "<td>" + elementY.name + "</td></tr>"
          end
        end
        countY += 1
      end
      surveyOptions = surveyOptions + "</tr>"
      countX += 1
    end  
    surveyOptions = surveyOptions + "</table>"  
    return surveyOptions.html_safe
  end
end
