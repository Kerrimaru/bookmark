class Bookmark < ApplicationRecord

  filterrific :default_filter_params => { sorted_by: 'created_at_desc' },
              :available_filters => [
                :sorted_by,
                :search_query,
                :with_tag_id
              ] 

  self.per_page = 30


  belongs_to :user
  has_one_attached :screenshot

  validates :url, presence: true
  #validates :screenshot, presence: true


  
 # define ActiveRecord scopes for
 # :search_query, :sorted_by, :with_tags_id, and :with_created_at_gte
  
  scope :search_query, lambda { |query|
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
  num_or_conds = 1
  where(
    terms.map {
        or_clauses = [
          "LOWER(bookmarks.title) LIKE ?"
        ].join(' OR ')
        "(#{ or_clauses })"
      }.join(' AND '),
      *terms.map { |e| [e] * num_or_conditions }.flatten
    )
  }

  #   terms.map { |term|
  #     "(LOWER(bookmarks.title) LIKE ? )"
  #   }.join(' AND '),
  #   *terms.map { |e| [e] * num_or_conds }.flatten
  # )
  # }

  scope :sorted_by, lambda { |sort_option|
  # extract the sort direction from the param value.
  direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
  case sort_option.to_s
  when /^created_at_/
    # Simple sort on the created_at column.
    order("bookmarks.created_at #{ direction }")
  when /^title_/
    # Simple sort on the title columns
    order("LOWER(bookmarks.title) #{ direction }")
  when /^tag_/
    # Simple sort on the tag columns
    order("LOWER(bookmarks.tag) #{ direction }")
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
      ['Title (a-z)', 'title_asc'],
      ['Saved date (newest first)', 'created_at_desc'],
      ['Saved date (oldest first)', 'created_at_asc'],
      ['Tag (a-z)', 'tag_name_asc']
    ]
  end

end
