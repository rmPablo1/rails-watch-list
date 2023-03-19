if @review.persisted?
  json.form render(partial: "reviews/forms", formats: :html, locals: {list: @list, review: Review.new})
  json.inserted_item render(partial: " lists/review", formats: :html, locals: {review: @review})
else
  json.form render(partial: "reviews/forms", formats: :html, locals: {list: @list, review: @review})
end
