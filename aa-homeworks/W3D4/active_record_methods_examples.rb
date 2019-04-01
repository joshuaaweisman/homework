CHECK OUT THE BELOW SCHEMA:

-----------------------------------------------------------
ActiveRecord::Schema.define(:version => 20130126200858) do
    create_table "comments", force: :cascade do |t|
      # force: true drops the table before creating it.
      t.text     "body"
      t.integer  "author_id"
      t.integer  "post_id"
      t.integer  "parent_comment_id"
      t.datetime "created_at",        null: false
      t.datetime "updated_at",        null: false
    end
  
    create_table "posts", force: :cascade do |t|
      t.string   "title"
      t.text     "body"
      t.integer  "author_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      # null: false means this field must be filled.
    end
  
    create_table "users", force: :cascade do |t|
      t.string   "user_name"
      t.string   "first_name"
      t.string   "last_name"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
  -----------------------------------------------------------


TASK 1
Find all the comments made by a user with the user_name 'Jonathan'


VERSION 1: SQL
    SELECT
        comments.*
    FROM
        comments
    JOIN
        users.id = comments.author_id
    WHERE
        users.user_name = 'Jonathan'


VERSION 2: ActiveRecord
    Comment.joins(:author).where(users: { user_name: 'Jonathan'} )
        ^      ^      ^      ^     ^           ^         ^
        ^      ^      ^      ^     ^           ^         ^
        ^      ^      ^      ^     ^           ^         ^
    comment  join   the     and  ...users... who...    have the name
    is a    this   AUTHOR  grab                        'Jonathan'
    MODEL   table   table   all
    of the   with           the...
    table
    called
    "Comments"


-----------------------------------------------------------


TASK 2
Join several tables together


VERSION 1: SQL
    SELECT
        users.*
    FROM
        users
    JOIN
        posts ON posts.author_id = users.id
    JOIN
        comments ON comments.post_id = posts.id



VERSION 2: ActiveRecord
    User.joins(posts: :comments)