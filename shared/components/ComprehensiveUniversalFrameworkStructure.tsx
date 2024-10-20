import React, { useState } from 'react'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card"
import { Button } from "@/components/ui/button"
import { ChevronRight, ChevronDown, Folder, File, Code, Database, Server, Globe, Brain, Settings, FileText, Smartphone, Laptop, Cloud, Watch, Tv, Home, Beaker } from 'lucide-react'

type TreeItem = {
  name: string;
  icon: React.ElementType;
  children?: TreeItem[];
}

const structure: TreeItem[] = [
  { name: "universal-framework", icon: Folder, children: [
    { name: "core", icon: Folder, children: [
      { name: "auth", icon: Folder, children: [
        { name: "services", icon: Folder },
        { name: "middleware", icon: Folder },
        { name: "models", icon: Folder },
      ]},
      { name: "database", icon: Folder, children: [
        { name: "migrations", icon: Folder },
        { name: "seeds", icon: Folder },
        { name: "models", icon: Folder },
      ]},
      { name: "api", icon: Folder, children: [
        { name: "routes", icon: Folder },
        { name: "controllers", icon: Folder },
        { name: "middleware", icon: Folder },
      ]},
      { name: "utils", icon: Folder },
    ]},
    { name: "modules", icon: Folder, children: [
      { name: "nexus", icon: Folder, children: [
        { name: "frontend", icon: Folder, children: [
          { name: "src", icon: Folder, children: [
            { name: "components", icon: Folder },
            { name: "pages", icon: Folder },
            { name: "styles", icon: Folder },
            { name: "hooks", icon: Folder },
            { name: "context", icon: Folder },
            { name: "types", icon: Folder },
          ]},
          { name: "public", icon: Folder },
          { name: "tests", icon: Folder },
          { name: "package.json", icon: File },
          { name: "tsconfig.json", icon: File },
          { name: "next.config.js", icon: File },
        ]},
        { name: "backend", icon: Folder, children: [
          { name: "src", icon: Folder, children: [
            { name: "api", icon: Folder },
            { name: "config", icon: Folder },
            { name: "controllers", icon: Folder },
            { name: "middleware", icon: Folder },
            { name: "models", icon: Folder },
            { name: "routes", icon: Folder },
            { name: "services", icon: Folder },
            { name: "utils", icon: Folder },
          ]},
          { name: "tests", icon: Folder },
          { name: "package.json", icon: File },
          { name: "tsconfig.json", icon: File },
        ]},
        { name: "ios", icon: Folder, children: [
          { name: "Nexus", icon: Folder },
          { name: "NexusTests", icon: Folder },
          { name: "NexusUITests", icon: Folder },
          { name: "Nexus.xcodeproj", icon: File },
        ]},
        { name: "shared", icon: Folder, children: [
          { name: "types", icon: Folder },
          { name: "utils", icon: Folder },
          { name: "constants", icon: Folder },
        ]},
        { name: "docs", icon: Folder },
        { name: "scripts", icon: Folder },
        { name: "config", icon: Folder },
      ]},
      { name: "bear-project", icon: Folder, children: [
        { name: "src", icon: Folder },
        { name: "tests", icon: Folder },
        { name: "docs", icon: Folder },
        { name: "config", icon: Folder },
      ]},
      { name: "berjak-project", icon: Folder, children: [
        { name: "src", icon: Folder },
        { name: "tests", icon: Folder },
        { name: "docs", icon: Folder },
        { name: "config", icon: Folder },
      ]},
      { name: "tata-ai", icon: Folder, children: [
        { name: "src", icon: Folder },
        { name: "tests", icon: Folder },
        { name: "docs", icon: Folder },
        { name: "config", icon: Folder },
      ]},
      { name: "cloud-management", icon: Folder, children: [
        { name: "provisioning", icon: Folder },
        { name: "monitoring", icon: Folder },
        { name: "scaling", icon: Folder },
        { name: "security", icon: Folder },
      ]},
    ]},
    { name: "platforms", icon: Folder, children: [
      { name: "web", icon: Globe, children: [
        { name: "react", icon: Folder },
        { name: "vue", icon: Folder },
      ]},
      { name: "mobile", icon: Smartphone, children: [
        { name: "ios", icon: Folder },
        { name: "android", icon: Folder },
        { name: "react-native", icon: Folder },
        { name: "flutter", icon: Folder },
      ]},
      { name: "desktop", icon: Laptop, children: [
        { name: "macos", icon: Folder },
        { name: "windows", icon: Folder },
        { name: "linux", icon: Folder },
        { name: "electron", icon: Folder },
      ]},
      { name: "wearables", icon: Watch, children: [
        { name: "watchos", icon: Folder },
        { name: "wear-os", icon: Folder },
        { name: "tizen", icon: Folder },
      ]},
      { name: "tv", icon: Tv, children: [
        { name: "tvos", icon: Folder },
        { name: "android-tv", icon: Folder },
        { name: "tizen-tv", icon: Folder },
      ]},
      { name: "smart-devices", icon: Home, children: [
        { name: "homekit", icon: Folder },
        { name: "google-home", icon: Folder },
        { name: "alexa", icon: Folder },
      ]},
    ]},
    { name: "shared", icon: Folder, children: [
      { name: "components", icon: Folder },
      { name: "styles", icon: Folder },
      { name: "types", icon: Folder },
      { name: "constants", icon: Folder },
      { name: "adapters", icon: Folder },
    ]},
    { name: "playground", icon: Beaker, children: [
      { name: "experimental-components", icon: Folder },
      { name: "feature-prototypes", icon: Folder },
    ]},
    { name: "config", icon: Folder, children: [
      { name: "environment.json", icon: File },
      { name: "versions.json", icon: File },
      { name: "database.json", icon: File },
      { name: "api.json", icon: File },
      { name: "cloud.json", icon: File },
    ]},
    { name: "scripts", icon: Folder, children: [
      { name: "build.js", icon: File },
      { name: "deploy.js", icon: File },
      { name: "update-versions.js", icon: File },
      { name: "db-migrate.js", icon: File },
      { name: "test-runner.js", icon: File },
      { name: "cloud-provision.js", icon: File },
    ]},
    { name: "docs", icon: Folder, children: [
      { name: "architecture", icon: Folder },
      { name: "api", icon: Folder },
      { name: "deployment", icon: Folder },
      { name: "development", icon: Folder },
      { name: "testing", icon: Folder },
      { name: "user-guides", icon: Folder },
      { name: "platforms", icon: Folder },
      { name: "cloud-management", icon: Folder },
    ]},
    { name: "tests", icon: Folder, children: [
      { name: "unit", icon: Folder },
      { name: "integration", icon: Folder },
      { name: "e2e", icon: Folder },
      { name: "performance", icon: Folder },
      { name: "security", icon: Folder },
      { name: "platform-specific", icon: Folder },
    ]},
    { name: "ci-cd", icon: Folder, children: [
      { name: "pipelines", icon: Folder },
      { name: "docker", icon: Folder },
      { name: "kubernetes", icon: Folder },
      { name: "platform-builds", icon: Folder },
    ]},
    { name: ".gitignore", icon: File },
    { name: "README.md", icon: File },
    { name: "CHANGELOG.md", icon: File },
    { name: "LICENSE", icon: File },
    { name: "package.json", icon: File },
  ]}
]

function TreeNode({ item }: { item: TreeItem }) {
  const [isOpen, setIsOpen] = useState(false)
  const hasChildren = item.children && item.children.length > 0

  return (
    <li className="my-1">
      <div className="flex items-center">
        {hasChildren ? (
          <Button
            variant="ghost"
            size="sm"
            className="p-0 h-6 w-6"
            onClick={() => setIsOpen(!isOpen)}
            aria-expanded={isOpen}
          >
            {isOpen ? <ChevronDown className="h-4 w-4" /> : <ChevronRight className="h-4 w-4" />}
          </Button>
        ) : (
          <span className="w-6"></span>
        )}
        <item.icon className="w-4 h-4 mr-2 text-primary" />
        <span>{item.name}</span>
      </div>
      {hasChildren && isOpen && (
        <ul className="pl-6">
          {item.children.map((child, index) => (
            <TreeNode key={index} item={child} />
          ))}
        </ul>
      )}
    </li>
  )
}

export default function ComprehensiveUniversalFrameworkStructure() {
  return (
    <Card className="w-full max-w-2xl">
      <CardHeader>
        <CardTitle>Comprehensive Universal Framework Structure</CardTitle>
        <CardDescription>Detailed visualization of the framework structure, including all layers and the playground area</CardDescription>
      </CardHeader>
      <CardContent>
        <ul className="pl-4">
          {structure.map((item, index) => (
            <TreeNode key={index} item={item} />
          ))}
        </ul>
      </CardContent>
    </Card>
  )
}