<div class="{{{ if config.theme.stickyToolbar }}}sticky-tools{{{ end }}} mb-3">
    <nav class="topic-list-header d-flex flex-nowrap my-2 p-0 border-0 rounded">
        <div class="d-flex flex-row p-2 text-bg-light gap-1 border rounded w-100 align-items-center">
            <div component="category/controls" class="d-flex me-auto mb-0 gap-2 flex-wrap">
                {{{ if template.category }}}
                <!-- IMPORT partials/category/watch.tpl -->
                <!-- IMPORT partials/tags/filter-dropdown-left.tpl -->
                <!-- IMPORT partials/category/sort.tpl -->
                {{{ end }}}
                {{{ if (template.popular || template.top)}}}
                <!-- IMPORT partials/topic-terms.tpl -->
                {{{ end }}}
                {{{ if (template.unread || (template.recent || (template.popular || template.top))) }}}
                <!-- IMPORT partials/topic-filters.tpl -->
                <!-- IMPORT partials/category/filter-dropdown-left.tpl -->
                <!-- IMPORT partials/tags/filter-dropdown-left.tpl -->
                {{{ end }}}
                {{{ if template.unread }}}
                <div class="markread btn-group {{{ if !topics.length }}}hidden{{{ end }}}">
                    <!-- IMPORT partials/category/selector-dropdown-left.tpl -->
                </div>
                {{{ end }}}
                {{{ if template.tag }}}
                <!-- IMPORT partials/category/filter-dropdown-left.tpl -->
                <!-- IMPORT partials/tags/watch.tpl -->
                {{{ end }}}
                <!-- IMPORT partials/category/tools.tpl -->

                {{{ if (!feeds:disableRSS && rssFeedUrl) }}}
                <a class="btn-ghost-sm d-none d-lg-flex align-self-stretch" target="_blank" href="{rssFeedUrl}" itemprop="item" title="[[global:rss-feed]]"><i class="fa fa-rss text-primary"></i></a>
                {{{ end }}}

                <a href="{{{ if template.category }}}{url}{{{ else }}}{config.relative_path}/{selectedFilter.url}{querystring}{{{ end }}}" class="btn btn-secondary fw-semibold position-absolute top-100 translate-middle-x start-50 mt-1 hide" style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;" id="new-topics-alert">
                    <i class="fa fa-fw fa-arrow-up"></i> [[recent:load-new-posts]]
                </a>
            </div>

            <div class="d-flex gap-1 align-items-center">
                {{{ if template.category }}}
                    {{{ if privileges.topics:create }}}
                    <a href="{config.relative_path}/compose?cid={cid}" component="category/post" id="new_topic" class="btn btn-primary btn-sm text-nowrap" data-ajaxify="false" role="button">[[category:new-topic-button]]</a>
                    {{{ end }}}
                {{{ else }}}
                    {{{ if canPost }}}
                    <!-- IMPORT partials/buttons/newTopic.tpl -->
                    {{{ end }}}
                {{{ end }}}
                {{{ if (!loggedIn && (!privileges.topics:create && !canPost))}}}
                <a component="category/post/guest" href="{config.relative_path}/login" class="btn btn-sm btn-primary">[[category:guest-login-post]]</a>
                {{{ end }}}
            </div>
        </div>
    </nav>
</div>

<!-- Menú de Trimestres -->
<div class="d-flex flex-row p-2 text-bg-light gap-1 border rounded w-100 align-items-center mb-3">
    <nav class="d-flex gap-2">
        <a href="#trimestre-1" class="btn btn-secondary btn-sm" onclick="showTrimester('trimestre-1')">Primer Trimestre</a>
        <a href="#trimestre-2" class="btn btn-secondary btn-sm" onclick="showTrimester('trimestre-2')">Segundo Trimestre</a>
        <a href="#trimestre-3" class="btn btn-secondary btn-sm" onclick="showTrimester('trimestre-3')">Tercer Trimestre</a>
    </nav>
</div>



<!-- Lista de Cursos por Trimestre -->
<div class="mt-3">
    <!-- Primer Trimestre -->
    <section id="trimestre-1" class="mb-4 trimester-section hidden">
        <h5>Primer Trimestre</h5>
        <ul class="list-group">
            <li class="list-group-item">MA1111: Matemáticas I</li>
            <li class="list-group-item">ID1111: Inglés I</li>
            <li class="list-group-item">LLA111: Lenguaje I</li>
      <li class="list-group-item">CSA211: Venezuela ante el Siglo XXI </li>
        </ul>
    </section>

    <!-- Segundo Trimestre -->
    <section id="trimestre-2" class="mb-4 trimester-section hidden">
        <h5>Segundo Trimestre</h5>
        <ul class="list-group">
            <li class="list-group-item">MA1112: Matemáticas II</li>
      <li class="list-group-item">FS1111: Fisica I</li>
            <li class="list-group-item">ID1112: Inglés II</li>
            <li class="list-group-item">LLA112: Lenguaje II</li>
      <li class="list-group-item">CSA212: Venezuela ante el Siglo XXI </li>
        </ul>
    </section>

    <!-- Tercer Trimestre -->
    <section id="trimestre-3" class="mb-4 trimester-section hidden">
        <h5>Tercer Trimestre</h5>
        <ul class="list-group">
            <li class="list-group-item">MA1113: Matemáticas III</li>
      <li class="list-group-item">FS1112: Fisica II</li>
            <li class="list-group-item">ID1113: Inglés III</li>
            <li class="list-group-item">LLA113: Lenguaje III</li>
      <li class="list-group-item">CSA213: Venezuela ante el Siglo XXI </li>
        </ul>
    </section>
</div>

<!-- CSS para ocultar elementos -->
<style>
    .hidden {
        display: none;
    }
</style>

<!-- Script para mostrar solo el trimestre seleccionado -->
<script>
    function showTrimester(id) {
        document.querySelectorAll('.trimester-section').forEach(section => {
            section.classList.add('hidden');
        });
        document.getElementById(id).classList.remove('hidden');
    }
</script>