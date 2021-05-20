# myproducts.pdf.prawn

prawn_document do |pdf|
  pdf.text 'Resumo financeiro do mês'
  pdf.move_down 20
  pdf.table @entrance.collect{|p| [p.id, p.description, p.date_of_entrance, p.value]}
end
