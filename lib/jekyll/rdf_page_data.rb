module Jekyll

  ##
  # JekyllRdf::RdfPageData creates pages for each RDF resource using a given template
  #
  class RdfPageData < Jekyll::Page

    ##
    # initialize initializes the page
    # * +site+ - The Jekyll site we want to enrich with RDF data
    # * +base+ - The base of the site
    # * +resource+ - The RDF resource for which the page is rendered
    # * +graph+ - The whole RDF graph
    #
    def initialize(site, base, resource)
      @site = site
      @base = base
      @dir = "rdfsites" # in this directory all RDF sites are stored
      @name = resource.filename
      self.process(@name)

      # use given template rdf_index.html
      self.read_yaml(File.join(base, '_layouts'), 'rdf_index.html')
      self.data['title'] = resource.name
      self.data['rdf'] = resource

      resource.page = self
      resource.site = site
      site.data['resources'] << resource
    end

  end

end
