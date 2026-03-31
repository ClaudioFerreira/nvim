return {
  "L3MON4D3/LuaSnip",
  build = "make install_jsregexp",
  dependencies = { "rafamadriz/friendly-snippets" },
  config = function()
    local ls = require("luasnip")
    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node
    local f = ls.function_node

    require("luasnip.loaders.from_vscode").lazy_load()

    -- Angular Component
    ls.add_snippets("typescript", {
      s("ang:comp", {
        t({
          "import { Component } from '@angular/core';",
          "",
          "@Component({",
          "  selector: 'app-",
        }),
        i(1, "component-name"),
        t({
          "',",
          "  templateUrl: './",
        }),
        i(2, "component-name"),
        t({
          ".component.html',",
          "  styleUrls: ['./",
        }),
        i(3, "component-name"),
        t({
          ".component.css']",
          "})",
          "export class ",
        }),
        f(function(args)
          local name = args[1][1]
          return name:sub(1, 1):upper() .. name:sub(2):gsub("%-(%w)", function(w)
            return w:upper()
          end) .. "Component"
        end, { 1 }),
        t({
          " {",
          "  constructor() { }",
          "",
          "  ngOnInit(): void {",
          "  }",
          "}",
        }),
      }),
    })

    -- Angular Service
    ls.add_snippets("typescript", {
      s("ang:service", {
        t({
          "import { Injectable } from '@angular/core';",
          "",
          "@Injectable({",
          "  providedIn: 'root'",
          "})",
          "export class ",
        }),
        i(1, "MyService"),
        t({
          " {",
          "  constructor() { }",
          "}",
        }),
      }),
    })

    -- NestJS Controller
    ls.add_snippets("typescript", {
      s("nest:controller", {
        t({
          "import { Controller, Get, Post, Body } from '@nestjs/common';",
          "import { ",
        }),
        i(1, "MyService"),
        t({
          " } from './",
        }),
        f(function(args)
          return args[1][1]:lower()
        end, { 1 }),
        t({
          ".service';",
          "",
          "@Controller('",
        }),
        i(2, "route"),
        t({
          "')",
          "export class ",
        }),
        f(function(args)
          return args[1][1] .. "Controller"
        end, { 1 }),
        t({
          " {",
          "  constructor(private readonly service: ",
        }),
        f(function(args)
          return args[1][1]
        end, { 1 }),
        t({
          ") {}",
          "",
          "  @Get()",
          "  findAll() {",
          "    return this.service.findAll();",
          "  }",
          "}",
        }),
      }),
    })

    -- NestJS Service
    ls.add_snippets("typescript", {
      s("nest:service", {
        t({
          "import { Injectable } from '@nestjs/common';",
          "",
          "@Injectable()",
          "export class ",
        }),
        i(1, "MyService"),
        t({
          " {",
          "  constructor() {}",
          "",
          "  findAll() {",
          "    return `This is a message from ",
        }),
        i(2, "my service"),
        t({
          "`;",
          "  }",
          "}",
        }),
      }),
    })

    -- Kotlin Class
    ls.add_snippets("kotlin", {
      s("kt:class", {
        t("class "),
        i(1, "MyClass"),
        t({
          " {",
          "  ",
        }),
        i(2),
        t({
          "",
          "}",
        }),
      }),
    })

    -- Kotlin Data Class
    ls.add_snippets("kotlin", {
      s("kt:data", {
        t("data class "),
        i(1, "MyData"),
        t({
          "(",
          "  ",
        }),
        i(2),
        t({
          "",
          ")",
        }),
      }),
    })
  end,
}
