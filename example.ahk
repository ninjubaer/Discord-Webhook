#Include <WEBHOOK>
#Include "YOUR_GDIP_PATH" ; Replace with your gdip path... can be relative, absolute or a lib folder

; Create a new webhook
webhook := WebHookBuilder("YOUR_WEBHOOK_URL")

; Just some gdi+ stuff
pToken:=Gdip_Startup()
pBitmap:=Gdip_BitmapFromScreen()

; Create an attachment
attachment := AttachmentBuilder(pBitmap) ; path or pBitmap

; Create a new embed
myEmbed := EmbedBuilder()
    .setTitle("Your Title Here")
    .setDescription("Your Description Here")
    .setColor(0x232323)
    .setImage(attachment)
    .setFooter({text: "Your Footer"})
    .setTimeStamp()

; send something to the webhook

webhook.send({
    content: "text outside of embed",
    embeds: [myEmbed],
    files: [attachment]
})

Gdip_DisposeImage(pBitmap)

