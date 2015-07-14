canonical_dude ist a small helper for Rails applications to make use of the Canonical URL Tag. Use it to set your
preferred version of a URL.

## Installation

```ruby
# for system wide usage
gem install 'canonical_dude'

# or just in your Gemfile
gem 'canonical_dude'
```


## Usage
canonical_dude is really easy to use. You only need to put the following into your HTML head:

```ruby
<%= canonical_link_tag %>
```

This is it, you'll now see the canonical URL tag for your current page, because by default, canonical_dude will use the
request.url. Probably, this will not quite be what you are looking for since you want to define your canonical url by
yourself. Not a problem. You also have a controller method available to custom define your canonical URL with some
extra whiz-bang!

Let's assume you have a Products model. Given we are in the ProductsController, you can specify the canonical in the
following way (taking the #show action as example):

```ruby
def show
  @product = Product.find ( params[:id] )
  canonical_url @product
end
```

This is simply defining the canonical tag via the :url_for method provided by Rails, so if you have your products
resource defined in routes.rb, then you're good to go. Also, the following examples result in exactly the same
canonical URL as shown above:

```ruby
# wrapped into url_for
canonical_url url_for(@product)

# giving a hash
canonical_url :action => "show", :id => @product.id
```

Now you might ask yourself: When it's _just_ using url_for, why do I need this gem altogether? Well, canonical_dude
gives you some freedom in defining your canonical urls by checking for special methods. Taking the above example again
with a standard rasource approach, you'll have the following URL to the products detail page: /products/:id.
Also, you have :product_path and :product_url defined as route helpers. Now if there's another product class defined
called AwesomeProduct ( which inherits from Product but obviously does extra cool stuff ;-), you might have another
URL for that, too. Sometimes, you have even more of those cases with all different kinds of URLs.

Being a good SEO Dude you can, of course, always exactly specify `canonical_url product_url(@product)`. Or you could
have it always in one place and just use `canonical_url @product` in all those controllers. All you need now is a helper
which could look like so:

```ruby
module CanonicalHelper

  # alias the AwesomeProduct's canonical url to our initial product url without affecting the awesome_product_url
  alias_method :canonical_awesome_product_url, :product_url

end
```


You can define the following helper methods for any class and canonical_dude will attempt to look for those:

```ruby
def canonical_product_url
  # ...
end

def canonical_product_path
  # ...
end

# and as the _grand_ fallback
def canonical_url
  # ...
end
```


If you have none of those methods defined, canonical_dude will, fallback again to whatevery :url_for gives you.
Also worth noting is, that, if you defined any custom canonical_* method which returns nil, canonical_dude will not
render the canonical_link_tag.

Last but not least, you can control when to show your canonical_link_tag with the canonical_link_tag? helper method:

```ruby
# in your HTML head of layouts/application.html.erb
<%= canonical_link_tag if canonical_link_tag? %>
```


canonical_link_tag? will return true if you have explicitly defined :canonical_url in your controller. If not, it returns
false. So if you only want a canonical tag on specific placed, you have a basic method for it.


Copyright (c) 2011 Rudolf Schmidt See LICENSE.txt for details.
