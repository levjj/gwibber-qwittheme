<%namespace name="base" file="base.mako">
  <%def name="content(data)">
    <div class="content" style="background: rgba(${data["color"].rgb}, 0.15)">
      <p style="padding:0;margin:0">
      % if data.get("rtl", False):
        <span class="text rtl">${data.get('content', '')}</span>
      % else:
        <span class="text">${data.get('content', '')}</span>
      % endif
      </p>
      <p style="float: right;padding:0;margin:0">
        ${base.sigil(data)}
        ${base.title(data)}
        <span class="time"> - ${base.timestring(data)}</span>
      </p>
      <div style="clear: both;" />
    </div>
  </%def>
</%namespace>

<html>
  <head>
    <script src="jquery.js"></script>
    <script>
      $(document).ready(function() {
        $(".message").hover(
          function() {$(this).find(".hidden").css("visibility", "visible")},
          function() {$(this).find(".hidden").css("visibility", "hidden")});

        $(".toggledupe").show(0).unbind().toggle(
          function() {$(this).closest(".basemsg").find(".dupes").show(100)},
          function() {$(this).closest(".basemsg").find(".dupes").hide(100)});
      });
    </script>
    <style>
      <%include file="theme.css" />
    </style>
  </head>
  <body>
    ${base.messages(message_store)}
  </body>
</html>
