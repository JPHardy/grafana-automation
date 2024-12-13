command_for_getting_dashboard_screenshot

curl -H "Authorization: Bearer glsa_Lkp05hJEtZoAj6fSwedfLyIg5uCuDTW0_9fb7c495" "https://humble-couscous-qp6qgj7r9q729jx4-8080.app.github.dev/api/datasources/proxy/uid/fe6t3evvsomioc" --output image.png

curl -H "Authorization: Bearer glsa_Lkp05hJEtZoAj6fSwedfLyIg5uCuDTW0_9fb7c495" "https://humble-couscous-qp6qgj7r9q729jx4-8080.app.github.dev/render/d-solo/your_dashboard_uid/your_panel_id?orgId=1&width=800&height=600&tz=UTC%2B00%3A00" --output image.png this is the correct one