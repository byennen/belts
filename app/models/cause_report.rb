class CauseReport

  include Datagrid

  scope do
    Cause
  end

  filter(:title, :string) {|value| where("title ilike '%#{value}%'")} 

  column :title
  column(:status) { |cause| cause.status ? "Yes" : "No" }
  column(:image, html: true) { |cause| image_tag cause.image.url(:small) }
  column(:action, html: true) do |cause|
    html = link_to "Edit", edit_admin_cause_path(cause), class: "btn btn-mini"
    html += " "
    html += link_to "Destroy", admin_cause_path(cause), class: "btn btn-mini btn-danger", 'data-confirm' => "Are you sure?"
  end

end