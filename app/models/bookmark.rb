class Bookmark < ApplicationRecord

  belongs_to :user
  has_one_attached :screenshot

  validates :url, presence: true
  #validates :screenshot, presence: true


  self.per_page = 30

  filterrific(
   default_filter_params: { sorted_by: 'created_at_desc' },
   available_filters: [
     :sorted_by,
     :search_query,
     :with_tag_id,
     :with_created_at_gte
   ]
 )
 # define ActiveRecord scopes for
 # :search_query, :sorted_by, :with_tags_id, and :with_created_at_gte
  
  scope :search_query, lambda { |query|
    # Filters students whose name or email matches the query
   # Searches the students table on the 'first_name' and 'last_name' columns.
  # Matches using LIKE, automatically appends '%' to each term.
  # LIKE is case INsensitive with MySQL, however it is case
  # sensitive with PostGreSQL. To make it work in both worlds,
  # we downcase everything.
  return nil  if query.blank?

  # condition query, parse into individual keywords
  terms = query.downcase.split(/\s+/)

  # replace "*" with "%" for wildcard searches,
  # append '%', remove duplicate '%'s
  terms = terms.map { |e|
    (e.gsub('*', '%') + '%').gsub(/%+/, '%')
  }
  # configure number of OR conditions for provision
  # of interpolation arguments. Adjust this if you
  # change the number of OR conditions.
  num_or_conds = 2
  where(
    terms.map { |term|
      "(LOWER(bookmarks.title) LIKE ? )"
    }.join(' AND '),
    *terms.map { |e| [e] * num_or_conds }.flatten
  )
  }

  scope :sorted_by, lambda { |sort_option|
  # extract the sort direction from the param value.
  direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
  case sort_option.to_s
  when /^created_at_/
    # Simple sort on the created_at column.
    # Make sure to include the table name to avoid ambiguous column names.
    # Joining on other tables is quite common in Filterrific, and almost
    # every ActiveRecord table has a 'created_at' column.
    order("bookmarks.created_at #{ direction }")
  when /^name_/
    # Simple sort on the name colums
    order("LOWER(bookmarks.title) #{ direction }")
  when /^tag_/
    # This sorts by a student's country name, so we need to include
    # the country. We can't use JOIN since not all students might have
    # a country.
    order("LOWER(bookmarks.title) #{ direction }").includes(:title).references(:title)
  else
    raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
  end
}

  scope :with_tag_id, lambda { |tag_ids|
    # Filters students with any of the given tag_ids
    where(with_tag_id: [*with_tag_id])
  }
  # scope :with_created_at_gte, lambda { |ref_date|
  #   where(with_created_at_gte: [*with_created_at_gte])
  # }

  # This method provides select options for the `sorted_by` filter select input.
  # It is called in the controller as part of `initialize_filterrific`.
  def self.options_for_sorted_by
    [
      ['Name (a-z)', 'name_asc'],
      ['Registration date (newest first)', 'created_at_desc'],
      ['Registration date (oldest first)', 'created_at_asc'],
      ['Tag (a-z)', 'tag_name_asc']
    ]
  end

end
