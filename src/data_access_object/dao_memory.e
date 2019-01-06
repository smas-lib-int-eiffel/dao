note
	description: "Summary description for {DAO_MEMORY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	DAO_MEMORY [G -> IDENTIFIABLE]

inherit
	DAO_LOADER [G]

feature -- Initialization

	make
			-- Create a new DAO.
		do
			create {LINKED_LIST [G]} last_list.make
		end

feature -- Input

	do_load_all
			-- <Precursor>
		do
			last_list := table.linear_representation
			is_ok := true
		end

	do_load_by_identification (an_identification: STRING)
			-- <Precursor>
		do
			last_list.wipe_out
			if attached table.item (an_identification) as la_item then
				last_list.extend (la_item)
				is_ok := true
			end
		end

	do_load_by_criteria (a_criteria: CRITERIA [ANY])
			-- Load all items meeting `a_criteria'.
		do
		end

	do_load_item_count
			-- <Precursor>
		do
			last_count := table.count
			is_ok := true
		end

	do_load_page (offset, count: NATURAL): INTEGER
			-- <Precursor>
		do
			last_list := table.linear_representation
			last_list.go_i_th (offset.as_integer_32)
			last_list := last_list.duplicate (count.as_integer_32)
			Result := last_list.count
			is_ok := true
		end

feature -- Element change

	save_item (an_item: G)
			-- <Precursor>
		do
			table.force (an_item, an_item.identification.out)
			last_list := table.linear_representation
			is_ok := true
		ensure
			has (an_item)
		end

feature -- Status report

	has (an_item: G): BOOLEAN
			--
		do
			Result := table.has_item (an_item)
		end

feature {NONE} -- Implementation

	table: HASH_TABLE [G, STRING]
			-- Used to access model data via their identification
		deferred
		end

end
