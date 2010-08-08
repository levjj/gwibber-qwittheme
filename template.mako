## Qwit Theme for Gwibber
## Copyright (C) 2010  Christopher Schuster <cs@livoris.de>

## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 2 of the License, or
## (at your option) any later version.

## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.

## You should have received a copy of the GNU General Public License along
## with this program; if not, write to the Free Software Foundation, Inc.,
## 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

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
