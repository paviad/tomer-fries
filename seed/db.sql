USE [master]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 26 Jun 2021 23:35:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DataProtectionKeys]    Script Date: 26 Jun 2021 23:35:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataProtectionKeys](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FriendlyName] [nvarchar](max) NULL,
	[Xml] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Is4_ApiResourceClaims]    Script Date: 26 Jun 2021 23:35:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Is4_ApiResourceClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](200) NOT NULL,
	[ApiResourceId] [int] NOT NULL,
 CONSTRAINT [PK_Is4_ApiResourceClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Is4_ApiResourceProperties]    Script Date: 26 Jun 2021 23:35:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Is4_ApiResourceProperties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](250) NOT NULL,
	[Value] [nvarchar](2000) NOT NULL,
	[ApiResourceId] [int] NOT NULL,
 CONSTRAINT [PK_Is4_ApiResourceProperties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Is4_ApiResources]    Script Date: 26 Jun 2021 23:35:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Is4_ApiResources](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Enabled] [bit] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[DisplayName] [nvarchar](200) NULL,
	[Description] [nvarchar](1000) NULL,
	[AllowedAccessTokenSigningAlgorithms] [nvarchar](100) NULL,
	[ShowInDiscoveryDocument] [bit] NOT NULL,
	[Created] [datetime2](7) NOT NULL,
	[Updated] [datetime2](7) NULL,
	[LastAccessed] [datetime2](7) NULL,
	[NonEditable] [bit] NOT NULL,
 CONSTRAINT [PK_Is4_ApiResources] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Is4_ApiResourceScopes]    Script Date: 26 Jun 2021 23:35:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Is4_ApiResourceScopes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Scope] [nvarchar](200) NOT NULL,
	[ApiResourceId] [int] NOT NULL,
 CONSTRAINT [PK_Is4_ApiResourceScopes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Is4_ApiResourceSecrets]    Script Date: 26 Jun 2021 23:35:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Is4_ApiResourceSecrets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[Value] [nvarchar](4000) NOT NULL,
	[Expiration] [datetime2](7) NULL,
	[Type] [nvarchar](250) NOT NULL,
	[Created] [datetime2](7) NOT NULL,
	[ApiResourceId] [int] NOT NULL,
 CONSTRAINT [PK_Is4_ApiResourceSecrets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Is4_ApiScopeClaims]    Script Date: 26 Jun 2021 23:35:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Is4_ApiScopeClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](200) NOT NULL,
	[ScopeId] [int] NOT NULL,
 CONSTRAINT [PK_Is4_ApiScopeClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Is4_ApiScopeProperties]    Script Date: 26 Jun 2021 23:35:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Is4_ApiScopeProperties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](250) NOT NULL,
	[Value] [nvarchar](2000) NOT NULL,
	[ScopeId] [int] NOT NULL,
 CONSTRAINT [PK_Is4_ApiScopeProperties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Is4_ApiScopes]    Script Date: 26 Jun 2021 23:35:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Is4_ApiScopes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Enabled] [bit] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[DisplayName] [nvarchar](200) NULL,
	[Description] [nvarchar](1000) NULL,
	[Required] [bit] NOT NULL,
	[Emphasize] [bit] NOT NULL,
	[ShowInDiscoveryDocument] [bit] NOT NULL,
 CONSTRAINT [PK_Is4_ApiScopes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[is4_AspNetRoleClaims]    Script Date: 26 Jun 2021 23:35:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[is4_AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_is4_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[is4_AspNetRoles]    Script Date: 26 Jun 2021 23:35:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[is4_AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_is4_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[is4_AspNetUserClaims]    Script Date: 26 Jun 2021 23:35:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[is4_AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_is4_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[is4_AspNetUserLogins]    Script Date: 26 Jun 2021 23:35:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[is4_AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_is4_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[is4_AspNetUserRoles]    Script Date: 26 Jun 2021 23:35:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[is4_AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_is4_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[is4_AspNetUsers]    Script Date: 26 Jun 2021 23:35:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[is4_AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_is4_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[is4_AspNetUserTokens]    Script Date: 26 Jun 2021 23:35:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[is4_AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_is4_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Is4_ClientClaims]    Script Date: 26 Jun 2021 23:35:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Is4_ClientClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](250) NOT NULL,
	[Value] [nvarchar](250) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_Is4_ClientClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Is4_ClientCorsOrigins]    Script Date: 26 Jun 2021 23:35:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Is4_ClientCorsOrigins](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Origin] [nvarchar](150) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_Is4_ClientCorsOrigins] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Is4_ClientGrantTypes]    Script Date: 26 Jun 2021 23:35:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Is4_ClientGrantTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GrantType] [nvarchar](250) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_Is4_ClientGrantTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Is4_ClientIdPRestrictions]    Script Date: 26 Jun 2021 23:35:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Is4_ClientIdPRestrictions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Provider] [nvarchar](200) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_Is4_ClientIdPRestrictions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Is4_ClientPostLogoutRedirectUris]    Script Date: 26 Jun 2021 23:35:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Is4_ClientPostLogoutRedirectUris](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PostLogoutRedirectUri] [nvarchar](2000) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_Is4_ClientPostLogoutRedirectUris] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Is4_ClientProperties]    Script Date: 26 Jun 2021 23:35:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Is4_ClientProperties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](250) NOT NULL,
	[Value] [nvarchar](2000) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_Is4_ClientProperties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Is4_ClientRedirectUris]    Script Date: 26 Jun 2021 23:35:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Is4_ClientRedirectUris](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RedirectUri] [nvarchar](2000) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_Is4_ClientRedirectUris] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Is4_Clients]    Script Date: 26 Jun 2021 23:35:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Is4_Clients](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Enabled] [bit] NOT NULL,
	[ClientId] [nvarchar](200) NOT NULL,
	[ProtocolType] [nvarchar](200) NOT NULL,
	[RequireClientSecret] [bit] NOT NULL,
	[ClientName] [nvarchar](200) NULL,
	[Description] [nvarchar](1000) NULL,
	[ClientUri] [nvarchar](2000) NULL,
	[LogoUri] [nvarchar](2000) NULL,
	[RequireConsent] [bit] NOT NULL,
	[AllowRememberConsent] [bit] NOT NULL,
	[AlwaysIncludeUserClaimsInIdToken] [bit] NOT NULL,
	[RequirePkce] [bit] NOT NULL,
	[AllowPlainTextPkce] [bit] NOT NULL,
	[RequireRequestObject] [bit] NOT NULL,
	[AllowAccessTokensViaBrowser] [bit] NOT NULL,
	[FrontChannelLogoutUri] [nvarchar](2000) NULL,
	[FrontChannelLogoutSessionRequired] [bit] NOT NULL,
	[BackChannelLogoutUri] [nvarchar](2000) NULL,
	[BackChannelLogoutSessionRequired] [bit] NOT NULL,
	[AllowOfflineAccess] [bit] NOT NULL,
	[IdentityTokenLifetime] [int] NOT NULL,
	[AllowedIdentityTokenSigningAlgorithms] [nvarchar](100) NULL,
	[AccessTokenLifetime] [int] NOT NULL,
	[AuthorizationCodeLifetime] [int] NOT NULL,
	[ConsentLifetime] [int] NULL,
	[AbsoluteRefreshTokenLifetime] [int] NOT NULL,
	[SlidingRefreshTokenLifetime] [int] NOT NULL,
	[RefreshTokenUsage] [int] NOT NULL,
	[UpdateAccessTokenClaimsOnRefresh] [bit] NOT NULL,
	[RefreshTokenExpiration] [int] NOT NULL,
	[AccessTokenType] [int] NOT NULL,
	[EnableLocalLogin] [bit] NOT NULL,
	[IncludeJwtId] [bit] NOT NULL,
	[AlwaysSendClientClaims] [bit] NOT NULL,
	[ClientClaimsPrefix] [nvarchar](200) NULL,
	[PairWiseSubjectSalt] [nvarchar](200) NULL,
	[Created] [datetime2](7) NOT NULL,
	[Updated] [datetime2](7) NULL,
	[LastAccessed] [datetime2](7) NULL,
	[UserSsoLifetime] [int] NULL,
	[UserCodeType] [nvarchar](100) NULL,
	[DeviceCodeLifetime] [int] NOT NULL,
	[NonEditable] [bit] NOT NULL,
 CONSTRAINT [PK_Is4_Clients] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Is4_ClientScopes]    Script Date: 26 Jun 2021 23:35:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Is4_ClientScopes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Scope] [nvarchar](200) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_Is4_ClientScopes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Is4_ClientSecrets]    Script Date: 26 Jun 2021 23:35:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Is4_ClientSecrets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](2000) NULL,
	[Value] [nvarchar](4000) NOT NULL,
	[Expiration] [datetime2](7) NULL,
	[Type] [nvarchar](250) NOT NULL,
	[Created] [datetime2](7) NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_Is4_ClientSecrets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Is4_DeviceCodes]    Script Date: 26 Jun 2021 23:35:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Is4_DeviceCodes](
	[UserCode] [nvarchar](200) NOT NULL,
	[DeviceCode] [nvarchar](200) NOT NULL,
	[SubjectId] [nvarchar](200) NULL,
	[SessionId] [nvarchar](100) NULL,
	[ClientId] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[Expiration] [datetime2](7) NOT NULL,
	[Data] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Is4_DeviceCodes] PRIMARY KEY CLUSTERED 
(
	[UserCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Is4_IdentityResourceClaims]    Script Date: 26 Jun 2021 23:35:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Is4_IdentityResourceClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](200) NOT NULL,
	[IdentityResourceId] [int] NOT NULL,
 CONSTRAINT [PK_Is4_IdentityResourceClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Is4_IdentityResourceProperties]    Script Date: 26 Jun 2021 23:35:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Is4_IdentityResourceProperties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](250) NOT NULL,
	[Value] [nvarchar](2000) NOT NULL,
	[IdentityResourceId] [int] NOT NULL,
 CONSTRAINT [PK_Is4_IdentityResourceProperties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Is4_IdentityResources]    Script Date: 26 Jun 2021 23:35:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Is4_IdentityResources](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Enabled] [bit] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[DisplayName] [nvarchar](200) NULL,
	[Description] [nvarchar](1000) NULL,
	[Required] [bit] NOT NULL,
	[Emphasize] [bit] NOT NULL,
	[ShowInDiscoveryDocument] [bit] NOT NULL,
	[Created] [datetime2](7) NOT NULL,
	[Updated] [datetime2](7) NULL,
	[NonEditable] [bit] NOT NULL,
 CONSTRAINT [PK_Is4_IdentityResources] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Is4_PersistedGrants]    Script Date: 26 Jun 2021 23:35:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Is4_PersistedGrants](
	[Key] [nvarchar](200) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[SubjectId] [nvarchar](200) NULL,
	[SessionId] [nvarchar](100) NULL,
	[ClientId] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[Expiration] [datetime2](7) NULL,
	[ConsumedTime] [datetime2](7) NULL,
	[Data] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Is4_PersistedGrants] PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 26 Jun 2021 23:35:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[Size] [int] NULL,
	[Address] [nvarchar](450) NULL,
	[Phone] [nvarchar](50) NULL,
	[IsCrispy] [bit] NULL,
	[Notes] [nvarchar](max) NULL,
	[State] [int] NOT NULL,
	[TrackingState] [int] NOT NULL,
	[DateCreated] [datetimeoffset](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200905145713_Configuration', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200905145851_Identity', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210109225229_Pers', N'5.0.1')
GO
SET IDENTITY_INSERT [dbo].[DataProtectionKeys] ON 

INSERT [dbo].[DataProtectionKeys] ([Id], [FriendlyName], [Xml]) VALUES (1, N'key-53f41b5d-437e-43f1-9421-57baf54632de', N'<key id="53f41b5d-437e-43f1-9421-57baf54632de" version="1"><creationDate>2021-01-17T11:31:18.8836762Z</creationDate><activationDate>2021-01-17T11:31:17.7395008Z</activationDate><expirationDate>2021-04-17T11:31:17.7395008Z</expirationDate><descriptor deserializerType="Microsoft.AspNetCore.DataProtection.AuthenticatedEncryption.ConfigurationModel.AuthenticatedEncryptorDescriptorDeserializer, Microsoft.AspNetCore.DataProtection, Version=5.0.0.0, Culture=neutral, PublicKeyToken=adb9793829ddae60"><descriptor><encryption algorithm="AES_256_CBC" /><validation algorithm="HMACSHA256" /><masterKey p4:requiresEncryption="true" xmlns:p4="http://schemas.asp.net/2015/03/dataProtection"><!-- Warning: the key below is in an unencrypted form. --><value>qe4+Ao1q3WvYDZRhoUNi/qDoshB8cLTwfpAMALiWhBTFKc1EC0v6SqfU35MI8pRSdru2vCrhCsVhcxfmBU3uVw==</value></masterKey></descriptor></descriptor></key>')
INSERT [dbo].[DataProtectionKeys] ([Id], [FriendlyName], [Xml]) VALUES (2, N'key-582de061-7aef-4aee-9131-88a44e2f1dd3', N'<key id="582de061-7aef-4aee-9131-88a44e2f1dd3" version="1"><creationDate>2021-06-26T16:17:56.9716419Z</creationDate><activationDate>2021-06-26T16:17:56.6427834Z</activationDate><expirationDate>2021-09-24T16:17:56.6427834Z</expirationDate><descriptor deserializerType="Microsoft.AspNetCore.DataProtection.AuthenticatedEncryption.ConfigurationModel.AuthenticatedEncryptorDescriptorDeserializer, Microsoft.AspNetCore.DataProtection, Version=5.0.0.0, Culture=neutral, PublicKeyToken=adb9793829ddae60"><descriptor><encryption algorithm="AES_256_CBC" /><validation algorithm="HMACSHA256" /><masterKey p4:requiresEncryption="true" xmlns:p4="http://schemas.asp.net/2015/03/dataProtection"><!-- Warning: the key below is in an unencrypted form. --><value>p0d2c0QozMIzZFv5CdrRoOYxTKf47dTzqGgaYcfplDgEEBBCPoIl+IgtxURopy8JIyfUPv96v8gmirdrGR0z4A==</value></masterKey></descriptor></descriptor></key>')
SET IDENTITY_INSERT [dbo].[DataProtectionKeys] OFF
GO
SET IDENTITY_INSERT [dbo].[Is4_ApiResources] ON 

INSERT [dbo].[Is4_ApiResources] ([Id], [Enabled], [Name], [DisplayName], [Description], [AllowedAccessTokenSigningAlgorithms], [ShowInDiscoveryDocument], [Created], [Updated], [LastAccessed], [NonEditable]) VALUES (1, 1, N'api', N'api', NULL, NULL, 1, CAST(N'2021-01-16T11:45:29.1912896' AS DateTime2), NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Is4_ApiResources] OFF
GO
SET IDENTITY_INSERT [dbo].[Is4_ApiScopeClaims] ON 

INSERT [dbo].[Is4_ApiScopeClaims] ([Id], [Type], [ScopeId]) VALUES (1, N'admin', 1)
SET IDENTITY_INSERT [dbo].[Is4_ApiScopeClaims] OFF
GO
SET IDENTITY_INSERT [dbo].[Is4_ApiScopes] ON 

INSERT [dbo].[Is4_ApiScopes] ([Id], [Enabled], [Name], [DisplayName], [Description], [Required], [Emphasize], [ShowInDiscoveryDocument]) VALUES (1, 1, N'api', N'api', NULL, 0, 0, 1)
SET IDENTITY_INSERT [dbo].[Is4_ApiScopes] OFF
GO
SET IDENTITY_INSERT [dbo].[is4_AspNetUserClaims] ON 

INSERT [dbo].[is4_AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (1, N'947d1b97-b0aa-4b91-9a53-d8346c4b277d', N'name', N'Alice Smith')
INSERT [dbo].[is4_AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (2, N'947d1b97-b0aa-4b91-9a53-d8346c4b277d', N'given_name', N'Alice')
INSERT [dbo].[is4_AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (3, N'947d1b97-b0aa-4b91-9a53-d8346c4b277d', N'family_name', N'Smith')
INSERT [dbo].[is4_AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (4, N'947d1b97-b0aa-4b91-9a53-d8346c4b277d', N'website', N'http://alice.com')
INSERT [dbo].[is4_AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (5, N'14fd85b0-653e-4a0e-8314-0208611e1cab', N'website', N'http://bob.com')
INSERT [dbo].[is4_AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (6, N'14fd85b0-653e-4a0e-8314-0208611e1cab', N'family_name', N'Smith')
INSERT [dbo].[is4_AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (7, N'14fd85b0-653e-4a0e-8314-0208611e1cab', N'given_name', N'Bob')
INSERT [dbo].[is4_AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (8, N'14fd85b0-653e-4a0e-8314-0208611e1cab', N'name', N'Bob Smith')
INSERT [dbo].[is4_AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (9, N'14fd85b0-653e-4a0e-8314-0208611e1cab', N'location', N'somewhere')
INSERT [dbo].[is4_AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (10, N'2e493409-70ae-4968-bed4-6218f07df342', N'name', N'Aviad Pineles')
INSERT [dbo].[is4_AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (11, N'2e493409-70ae-4968-bed4-6218f07df342', N'email', N'paviad2@gmail.com')
INSERT [dbo].[is4_AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (12, N'2e493409-70ae-4968-bed4-6218f07df342', N'admin', N'True')
INSERT [dbo].[is4_AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (13, N'5f96489c-1487-49ce-a622-51fdb9511d0f', N'name', N'SypherTMC')
INSERT [dbo].[is4_AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (14, N'5f96489c-1487-49ce-a622-51fdb9511d0f', N'email', N'tomush93@gmail.com')
INSERT [dbo].[is4_AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (15, N'5f96489c-1487-49ce-a622-51fdb9511d0f', N'admin', N'True')
INSERT [dbo].[is4_AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (16, N'83b60c6d-1448-46c2-a2ae-19f434ba20a0', N'name', N'Ghaia Pineles')
INSERT [dbo].[is4_AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (17, N'83b60c6d-1448-46c2-a2ae-19f434ba20a0', N'email', N'ghaiap3@gmail.com')
SET IDENTITY_INSERT [dbo].[is4_AspNetUserClaims] OFF
GO
INSERT [dbo].[is4_AspNetUserLogins] ([LoginProvider], [ProviderKey], [ProviderDisplayName], [UserId]) VALUES (N'Google', N'103751997981305260077', N'Google', N'2e493409-70ae-4968-bed4-6218f07df342')
INSERT [dbo].[is4_AspNetUserLogins] ([LoginProvider], [ProviderKey], [ProviderDisplayName], [UserId]) VALUES (N'Google', N'105020540485742086813', N'Google', N'5f96489c-1487-49ce-a622-51fdb9511d0f')
INSERT [dbo].[is4_AspNetUserLogins] ([LoginProvider], [ProviderKey], [ProviderDisplayName], [UserId]) VALUES (N'Google', N'110740546086205086825', N'Google', N'83b60c6d-1448-46c2-a2ae-19f434ba20a0')
GO
INSERT [dbo].[is4_AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'14fd85b0-653e-4a0e-8314-0208611e1cab', N'bob', N'BOB', N'BobSmith@email.com', N'BOBSMITH@EMAIL.COM', 1, N'AQAAAAEAACcQAAAAEHTYbp+t1GssUoolbCofKV2/jUX9pddTLikwx/skVM56w8fIvixrnz/6uTqhbBLBZw==', N'O2RJED2BOKQIUTPL75Q2PW6D2VU46DIE', N'15bc83a3-292f-4610-918e-54c4afe2d784', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[is4_AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'2e493409-70ae-4968-bed4-6218f07df342', N'0ee66cca-43d1-4158-a318-b9931aed34ec', N'0EE66CCA-43D1-4158-A318-B9931AED34EC', NULL, NULL, 0, NULL, N'PAOIZFQSC6GF7CBM3EZ3XKUK5JNBQIDD', N'6298b854-27cf-408c-95ff-229e2b54a591', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[is4_AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'5f96489c-1487-49ce-a622-51fdb9511d0f', N'4d833626-fda4-427a-afeb-3d5c534a5128', N'4D833626-FDA4-427A-AFEB-3D5C534A5128', NULL, NULL, 0, NULL, N'JLV6E6PLYQNVNAKCSU6NHI6IAACJWLJW', N'bb429954-30b5-4e40-9030-2ccf60f6164f', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[is4_AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'83b60c6d-1448-46c2-a2ae-19f434ba20a0', N'e4f39542-ddc9-4a0d-9bfa-1d53dafbf5d9', N'E4F39542-DDC9-4A0D-9BFA-1D53DAFBF5D9', NULL, NULL, 0, NULL, N'ZA2D4JHFSJ2XXC3VIGYJCZ7BQ6GYQIHG', N'166f12f0-8edc-46e3-b710-0f280582ff9a', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[is4_AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'947d1b97-b0aa-4b91-9a53-d8346c4b277d', N'alice', N'ALICE', N'AliceSmith@email.com', N'ALICESMITH@EMAIL.COM', 1, N'AQAAAAEAACcQAAAAENOW4GKDrJMNFUhG21liO+ssvu2H+si9csu3PrlZHmYQV8aipyRTKkupvqbJjNalrw==', N'ZLCU5BCVLPRYKHYCEDX2TUIWLZPXKDPP', N'a8cf2b7a-6839-4db9-8c26-da041f6180ff', NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Is4_ClientCorsOrigins] ON 

INSERT [dbo].[Is4_ClientCorsOrigins] ([Id], [Origin], [ClientId]) VALUES (1, N'https://localhost:8081', 2)
INSERT [dbo].[Is4_ClientCorsOrigins] ([Id], [Origin], [ClientId]) VALUES (2, N'http://localhost:4200', 2)
INSERT [dbo].[Is4_ClientCorsOrigins] ([Id], [Origin], [ClientId]) VALUES (3, N'http://localhost:8080', 2)
SET IDENTITY_INSERT [dbo].[Is4_ClientCorsOrigins] OFF
GO
SET IDENTITY_INSERT [dbo].[Is4_ClientGrantTypes] ON 

INSERT [dbo].[Is4_ClientGrantTypes] ([Id], [GrantType], [ClientId]) VALUES (1, N'client_credentials', 1)
INSERT [dbo].[Is4_ClientGrantTypes] ([Id], [GrantType], [ClientId]) VALUES (2, N'authorization_code', 2)
SET IDENTITY_INSERT [dbo].[Is4_ClientGrantTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Is4_ClientPostLogoutRedirectUris] ON 

INSERT [dbo].[Is4_ClientPostLogoutRedirectUris] ([Id], [PostLogoutRedirectUri], [ClientId]) VALUES (1, N'https://localhost:8081/', 2)
INSERT [dbo].[Is4_ClientPostLogoutRedirectUris] ([Id], [PostLogoutRedirectUri], [ClientId]) VALUES (2, N'http://localhost:4200/', 2)
INSERT [dbo].[Is4_ClientPostLogoutRedirectUris] ([Id], [PostLogoutRedirectUri], [ClientId]) VALUES (3, N'http://localhost:8080/', 2)
SET IDENTITY_INSERT [dbo].[Is4_ClientPostLogoutRedirectUris] OFF
GO
SET IDENTITY_INSERT [dbo].[Is4_ClientRedirectUris] ON 

INSERT [dbo].[Is4_ClientRedirectUris] ([Id], [RedirectUri], [ClientId]) VALUES (1, N'https://localhost:8081/callback', 2)
INSERT [dbo].[Is4_ClientRedirectUris] ([Id], [RedirectUri], [ClientId]) VALUES (2, N'https://localhost:8081/silent-renew.html', 2)
INSERT [dbo].[Is4_ClientRedirectUris] ([Id], [RedirectUri], [ClientId]) VALUES (3, N'http://localhost:4200/callback', 2)
INSERT [dbo].[Is4_ClientRedirectUris] ([Id], [RedirectUri], [ClientId]) VALUES (4, N'http://localhost:4200/silent-renew.html', 2)
INSERT [dbo].[Is4_ClientRedirectUris] ([Id], [RedirectUri], [ClientId]) VALUES (5, N'http://localhost:8080/callback', 2)
INSERT [dbo].[Is4_ClientRedirectUris] ([Id], [RedirectUri], [ClientId]) VALUES (6, N'http://localhost:8080/silent-renew.html', 2)
SET IDENTITY_INSERT [dbo].[Is4_ClientRedirectUris] OFF
GO
SET IDENTITY_INSERT [dbo].[Is4_Clients] ON 

INSERT [dbo].[Is4_Clients] ([Id], [Enabled], [ClientId], [ProtocolType], [RequireClientSecret], [ClientName], [Description], [ClientUri], [LogoUri], [RequireConsent], [AllowRememberConsent], [AlwaysIncludeUserClaimsInIdToken], [RequirePkce], [AllowPlainTextPkce], [RequireRequestObject], [AllowAccessTokensViaBrowser], [FrontChannelLogoutUri], [FrontChannelLogoutSessionRequired], [BackChannelLogoutUri], [BackChannelLogoutSessionRequired], [AllowOfflineAccess], [IdentityTokenLifetime], [AllowedIdentityTokenSigningAlgorithms], [AccessTokenLifetime], [AuthorizationCodeLifetime], [ConsentLifetime], [AbsoluteRefreshTokenLifetime], [SlidingRefreshTokenLifetime], [RefreshTokenUsage], [UpdateAccessTokenClaimsOnRefresh], [RefreshTokenExpiration], [AccessTokenType], [EnableLocalLogin], [IncludeJwtId], [AlwaysSendClientClaims], [ClientClaimsPrefix], [PairWiseSubjectSalt], [Created], [Updated], [LastAccessed], [UserSsoLifetime], [UserCodeType], [DeviceCodeLifetime], [NonEditable]) VALUES (1, 1, N'm2m.client', N'oidc', 1, N'Client Credentials Client', NULL, NULL, NULL, 0, 1, 0, 1, 0, 0, 0, NULL, 1, NULL, 1, 0, 300, NULL, 3600, 300, NULL, 2592000, 1296000, 1, 0, 1, 0, 1, 1, 0, N'client_', NULL, CAST(N'2021-01-16T11:45:28.6679002' AS DateTime2), NULL, NULL, NULL, NULL, 300, 0)
INSERT [dbo].[Is4_Clients] ([Id], [Enabled], [ClientId], [ProtocolType], [RequireClientSecret], [ClientName], [Description], [ClientUri], [LogoUri], [RequireConsent], [AllowRememberConsent], [AlwaysIncludeUserClaimsInIdToken], [RequirePkce], [AllowPlainTextPkce], [RequireRequestObject], [AllowAccessTokensViaBrowser], [FrontChannelLogoutUri], [FrontChannelLogoutSessionRequired], [BackChannelLogoutUri], [BackChannelLogoutSessionRequired], [AllowOfflineAccess], [IdentityTokenLifetime], [AllowedIdentityTokenSigningAlgorithms], [AccessTokenLifetime], [AuthorizationCodeLifetime], [ConsentLifetime], [AbsoluteRefreshTokenLifetime], [SlidingRefreshTokenLifetime], [RefreshTokenUsage], [UpdateAccessTokenClaimsOnRefresh], [RefreshTokenExpiration], [AccessTokenType], [EnableLocalLogin], [IncludeJwtId], [AlwaysSendClientClaims], [ClientClaimsPrefix], [PairWiseSubjectSalt], [Created], [Updated], [LastAccessed], [UserSsoLifetime], [UserCodeType], [DeviceCodeLifetime], [NonEditable]) VALUES (2, 1, N'interactive', N'oidc', 1, NULL, NULL, NULL, NULL, 0, 1, 0, 1, 0, 0, 0, N'https://localhost:8081/signout-oidc', 1, NULL, 1, 1, 300, NULL, 3600, 300, NULL, 2592000, 1296000, 1, 0, 1, 0, 1, 1, 0, N'client_', NULL, CAST(N'2021-01-16T11:45:28.8243794' AS DateTime2), NULL, NULL, NULL, NULL, 300, 0)
SET IDENTITY_INSERT [dbo].[Is4_Clients] OFF
GO
SET IDENTITY_INSERT [dbo].[Is4_ClientScopes] ON 

INSERT [dbo].[Is4_ClientScopes] ([Id], [Scope], [ClientId]) VALUES (1, N'scope1', 1)
INSERT [dbo].[Is4_ClientScopes] ([Id], [Scope], [ClientId]) VALUES (2, N'openid', 2)
INSERT [dbo].[Is4_ClientScopes] ([Id], [Scope], [ClientId]) VALUES (3, N'profile', 2)
INSERT [dbo].[Is4_ClientScopes] ([Id], [Scope], [ClientId]) VALUES (4, N'email', 2)
INSERT [dbo].[Is4_ClientScopes] ([Id], [Scope], [ClientId]) VALUES (5, N'api', 2)
SET IDENTITY_INSERT [dbo].[Is4_ClientScopes] OFF
GO
SET IDENTITY_INSERT [dbo].[Is4_ClientSecrets] ON 

INSERT [dbo].[Is4_ClientSecrets] ([Id], [Description], [Value], [Expiration], [Type], [Created], [ClientId]) VALUES (1, NULL, N'fU7fRb+g6YdlniuSqviOLWNkda1M/MuPtH6zNI9inF8=', NULL, N'SharedSecret', CAST(N'2021-01-16T11:45:28.6681970' AS DateTime2), 1)
INSERT [dbo].[Is4_ClientSecrets] ([Id], [Description], [Value], [Expiration], [Type], [Created], [ClientId]) VALUES (2, NULL, N'o90IbCACXKUkunXoa18cODcLKnQTbjOo5ihEw9j58+8=', NULL, N'SharedSecret', CAST(N'2021-01-16T11:45:28.8243827' AS DateTime2), 2)
SET IDENTITY_INSERT [dbo].[Is4_ClientSecrets] OFF
GO
SET IDENTITY_INSERT [dbo].[Is4_IdentityResourceClaims] ON 

INSERT [dbo].[Is4_IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (1, N'website', 1)
INSERT [dbo].[Is4_IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (2, N'email_verified', 2)
INSERT [dbo].[Is4_IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (3, N'updated_at', 1)
INSERT [dbo].[Is4_IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (4, N'locale', 1)
INSERT [dbo].[Is4_IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (5, N'zoneinfo', 1)
INSERT [dbo].[Is4_IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (6, N'birthdate', 1)
INSERT [dbo].[Is4_IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (7, N'gender', 1)
INSERT [dbo].[Is4_IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (8, N'email', 2)
INSERT [dbo].[Is4_IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (9, N'name', 1)
INSERT [dbo].[Is4_IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (10, N'given_name', 1)
INSERT [dbo].[Is4_IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (11, N'middle_name', 1)
INSERT [dbo].[Is4_IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (12, N'nickname', 1)
INSERT [dbo].[Is4_IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (13, N'preferred_username', 1)
INSERT [dbo].[Is4_IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (14, N'profile', 1)
INSERT [dbo].[Is4_IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (15, N'picture', 1)
INSERT [dbo].[Is4_IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (16, N'family_name', 1)
INSERT [dbo].[Is4_IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (17, N'sub', 3)
INSERT [dbo].[Is4_IdentityResourceClaims] ([Id], [Type], [IdentityResourceId]) VALUES (18, N'admin', 1)
SET IDENTITY_INSERT [dbo].[Is4_IdentityResourceClaims] OFF
GO
SET IDENTITY_INSERT [dbo].[Is4_IdentityResources] ON 

INSERT [dbo].[Is4_IdentityResources] ([Id], [Enabled], [Name], [DisplayName], [Description], [Required], [Emphasize], [ShowInDiscoveryDocument], [Created], [Updated], [NonEditable]) VALUES (1, 1, N'profile', N'User profile', N'Your user profile information (first name, last name, etc.)', 0, 1, 1, CAST(N'2021-01-16T11:45:29.0696032' AS DateTime2), NULL, 0)
INSERT [dbo].[Is4_IdentityResources] ([Id], [Enabled], [Name], [DisplayName], [Description], [Required], [Emphasize], [ShowInDiscoveryDocument], [Created], [Updated], [NonEditable]) VALUES (2, 1, N'email', N'Your email address', NULL, 0, 1, 1, CAST(N'2021-01-16T11:45:29.0654972' AS DateTime2), NULL, 0)
INSERT [dbo].[Is4_IdentityResources] ([Id], [Enabled], [Name], [DisplayName], [Description], [Required], [Emphasize], [ShowInDiscoveryDocument], [Created], [Updated], [NonEditable]) VALUES (3, 1, N'openid', N'Your user identifier', NULL, 1, 0, 1, CAST(N'2021-01-16T11:45:29.0396020' AS DateTime2), NULL, 0)
SET IDENTITY_INSERT [dbo].[Is4_IdentityResources] OFF
GO
INSERT [dbo].[Orders] ([Id], [UserId], [Size], [Address], [Phone], [IsCrispy], [Notes], [State], [TrackingState], [DateCreated]) VALUES (N'02b82b01-303e-4441-8392-022a03dc09ad', N'5f96489c-1487-49ce-a622-51fdb9511d0f', 0, N'sdfg', N'sdfg', 1, N'sdfg', 3, 3, CAST(N'2021-01-17T17:37:06.2148727+00:00' AS DateTimeOffset))
INSERT [dbo].[Orders] ([Id], [UserId], [Size], [Address], [Phone], [IsCrispy], [Notes], [State], [TrackingState], [DateCreated]) VALUES (N'0096b648-10a5-423e-87b5-02d8d2f4d26b', N'b3ca2763-e8f0-4c47-abab-69ad4f8a1653', 2, N'fghj', N'gfhj', 1, N'fghj', 3, 3, CAST(N'2021-01-19T19:22:04.8120429+00:00' AS DateTimeOffset))
INSERT [dbo].[Orders] ([Id], [UserId], [Size], [Address], [Phone], [IsCrispy], [Notes], [State], [TrackingState], [DateCreated]) VALUES (N'4e1ba388-adf0-4399-8d11-03e92b2ee7a5', N'ed9ae3d5-8317-4920-a76e-573048b42e28', 0, NULL, NULL, 0, NULL, 0, 0, CAST(N'2021-01-19T20:49:36.0384124+00:00' AS DateTimeOffset))
INSERT [dbo].[Orders] ([Id], [UserId], [Size], [Address], [Phone], [IsCrispy], [Notes], [State], [TrackingState], [DateCreated]) VALUES (N'c1925672-f153-4193-baf3-0917dfd3f011', N'06543f49-596b-4cb9-af56-ba38fc49401d', 0, N'sdfgsdfg', N'sdfgsdfg', 0, N'sdfgsdfg', 3, 3, CAST(N'2021-01-17T20:09:29.2816941+00:00' AS DateTimeOffset))
INSERT [dbo].[Orders] ([Id], [UserId], [Size], [Address], [Phone], [IsCrispy], [Notes], [State], [TrackingState], [DateCreated]) VALUES (N'0258544a-8416-425c-983f-0aef5b89fc4e', N'8b584ea2-e6d0-406c-9909-20d38312a0fb', 2, NULL, NULL, 0, NULL, 1, 0, CAST(N'2021-01-19T21:16:56.2558370+00:00' AS DateTimeOffset))
INSERT [dbo].[Orders] ([Id], [UserId], [Size], [Address], [Phone], [IsCrispy], [Notes], [State], [TrackingState], [DateCreated]) VALUES (N'85dc7bd3-291e-4a83-94b0-119548a68838', N'359d1fd4-7364-417a-8963-e9cb9dc2c268', 1, N'gsdfg', N'sdfg', 0, NULL, 3, 3, CAST(N'2021-01-19T18:24:53.7814249+00:00' AS DateTimeOffset))
INSERT [dbo].[Orders] ([Id], [UserId], [Size], [Address], [Phone], [IsCrispy], [Notes], [State], [TrackingState], [DateCreated]) VALUES (N'a68d05b4-0ef5-4db0-87de-273dfa572199', N'9053dd66-ef2d-47b4-93be-29cf0900e0ca', 0, NULL, NULL, 0, NULL, 0, 0, CAST(N'2021-01-19T21:05:17.8855525+00:00' AS DateTimeOffset))
INSERT [dbo].[Orders] ([Id], [UserId], [Size], [Address], [Phone], [IsCrispy], [Notes], [State], [TrackingState], [DateCreated]) VALUES (N'57d50042-d91c-4982-8b6d-2bb17cc329c6', N'359d1fd4-7364-417a-8963-e9cb9dc2c268', 2, N'sdfg', N'dsfg', 1, N'sdfg', 3, 3, CAST(N'2021-01-19T18:21:14.2560212+00:00' AS DateTimeOffset))
INSERT [dbo].[Orders] ([Id], [UserId], [Size], [Address], [Phone], [IsCrispy], [Notes], [State], [TrackingState], [DateCreated]) VALUES (N'a48f7b46-9804-43f1-9c48-2c662a47bf4c', N'06543f49-596b-4cb9-af56-ba38fc49401d', 0, N'asdf', N'asdf', 1, N'asdf', 3, 3, CAST(N'2021-01-17T20:09:05.5032069+00:00' AS DateTimeOffset))
INSERT [dbo].[Orders] ([Id], [UserId], [Size], [Address], [Phone], [IsCrispy], [Notes], [State], [TrackingState], [DateCreated]) VALUES (N'70e013a0-70c7-4724-9e34-302351c55d25', N'06543f49-596b-4cb9-af56-ba38fc49401d', 0, N'sdfg', N'sdf', 1, N'sdfg', 3, 3, CAST(N'2021-01-17T20:04:45.5251026+00:00' AS DateTimeOffset))
INSERT [dbo].[Orders] ([Id], [UserId], [Size], [Address], [Phone], [IsCrispy], [Notes], [State], [TrackingState], [DateCreated]) VALUES (N'429dc4ed-584f-4b2c-96f5-337c6560a02a', N'2e493409-70ae-4968-bed4-6218f07df342', 0, N'ghfg', N'fghfgh', 1, N'fghfgh', 3, 3, CAST(N'2021-01-17T17:35:47.2188929+00:00' AS DateTimeOffset))
INSERT [dbo].[Orders] ([Id], [UserId], [Size], [Address], [Phone], [IsCrispy], [Notes], [State], [TrackingState], [DateCreated]) VALUES (N'bcf3714b-2af4-42be-ab50-34efdbdcb097', N'e574ad73-e734-419a-abbd-2c526377c9ec', 0, NULL, NULL, 0, NULL, 0, 0, CAST(N'2021-01-19T18:45:27.6755168+00:00' AS DateTimeOffset))
INSERT [dbo].[Orders] ([Id], [UserId], [Size], [Address], [Phone], [IsCrispy], [Notes], [State], [TrackingState], [DateCreated]) VALUES (N'392f2d8e-384e-4fe0-9dac-39a28e05b729', N'5c9e124d-0632-42c2-bddd-4516d247a79e', 0, NULL, NULL, 0, NULL, 0, 0, CAST(N'2021-01-17T19:55:51.5379210+00:00' AS DateTimeOffset))
INSERT [dbo].[Orders] ([Id], [UserId], [Size], [Address], [Phone], [IsCrispy], [Notes], [State], [TrackingState], [DateCreated]) VALUES (N'c9071a6e-1cfd-46f0-9287-4732990aab73', N'5f96489c-1487-49ce-a622-51fdb9511d0f', 0, N'sdfg', N'דגכע', 1, N'gjghj', 3, 3, CAST(N'2021-01-17T19:00:51.0137043+00:00' AS DateTimeOffset))
INSERT [dbo].[Orders] ([Id], [UserId], [Size], [Address], [Phone], [IsCrispy], [Notes], [State], [TrackingState], [DateCreated]) VALUES (N'a436979e-e710-4ce4-8b05-4a5b12dcbb70', N'06543f49-596b-4cb9-af56-ba38fc49401d', 2, N'gsdfg', N'sdfg', 1, N'sdfg', 3, 3, CAST(N'2021-01-17T20:12:29.1961782+00:00' AS DateTimeOffset))
INSERT [dbo].[Orders] ([Id], [UserId], [Size], [Address], [Phone], [IsCrispy], [Notes], [State], [TrackingState], [DateCreated]) VALUES (N'c338f718-ccd0-4ef7-95bc-59b25735d86d', N'14697877-9697-48c2-a5c3-28974a66aee7', 2, N'sdfg', N'sdfg', 1, N'sdfg', 3, 3, CAST(N'2021-01-19T18:29:39.1053801+00:00' AS DateTimeOffset))
INSERT [dbo].[Orders] ([Id], [UserId], [Size], [Address], [Phone], [IsCrispy], [Notes], [State], [TrackingState], [DateCreated]) VALUES (N'c8d6cb5c-d337-4737-85ef-5b13a47a3a4a', N'83b60c6d-1448-46c2-a2ae-19f434ba20a0', 0, NULL, NULL, 0, NULL, 0, 0, CAST(N'2021-01-19T19:21:14.0849227+00:00' AS DateTimeOffset))
INSERT [dbo].[Orders] ([Id], [UserId], [Size], [Address], [Phone], [IsCrispy], [Notes], [State], [TrackingState], [DateCreated]) VALUES (N'96f567f8-916a-4303-9121-71ce994e9eb7', N'5f96489c-1487-49ce-a622-51fdb9511d0f', 0, NULL, NULL, 0, NULL, 0, 0, CAST(N'2021-01-17T19:30:12.0957535+00:00' AS DateTimeOffset))
INSERT [dbo].[Orders] ([Id], [UserId], [Size], [Address], [Phone], [IsCrispy], [Notes], [State], [TrackingState], [DateCreated]) VALUES (N'22d0973d-1d11-468f-b9e0-7e78b7128538', N'06543f49-596b-4cb9-af56-ba38fc49401d', 0, N'dfgh', N'dfgh', 1, N'dfgh', 3, 3, CAST(N'2021-01-17T20:06:48.5323551+00:00' AS DateTimeOffset))
INSERT [dbo].[Orders] ([Id], [UserId], [Size], [Address], [Phone], [IsCrispy], [Notes], [State], [TrackingState], [DateCreated]) VALUES (N'ffd78504-88cc-4be7-a93e-855871f5ff16', N'5f96489c-1487-49ce-a622-51fdb9511d0f', 0, N'hjfg', N'fghjf', 1, N'ghfjghj', 3, 3, CAST(N'2021-01-17T18:37:11.0907739+00:00' AS DateTimeOffset))
INSERT [dbo].[Orders] ([Id], [UserId], [Size], [Address], [Phone], [IsCrispy], [Notes], [State], [TrackingState], [DateCreated]) VALUES (N'a974e750-89f2-446d-9d7c-85c93d1b0114', N'a0631093-9bc1-481b-98e6-cbab29234b9d', 0, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2021-01-19T22:30:51.7117422+00:00' AS DateTimeOffset))
INSERT [dbo].[Orders] ([Id], [UserId], [Size], [Address], [Phone], [IsCrispy], [Notes], [State], [TrackingState], [DateCreated]) VALUES (N'8f1eb8d6-2484-4093-beac-8b0a3bc1003d', N'2bf39175-f552-46aa-9a8f-394996602852', 0, NULL, NULL, 0, NULL, 0, 0, CAST(N'2021-01-19T19:06:48.9076726+00:00' AS DateTimeOffset))
INSERT [dbo].[Orders] ([Id], [UserId], [Size], [Address], [Phone], [IsCrispy], [Notes], [State], [TrackingState], [DateCreated]) VALUES (N'66fd3141-4ee6-4e14-b0c1-8df657759dae', N'fcdf7e07-dcbe-4e4b-942f-207fa0ccf895', 2, N'dsfgs', N'sdfgsd', 1, N'sdfg', 3, 3, CAST(N'2021-01-19T18:48:25.5912050+00:00' AS DateTimeOffset))
INSERT [dbo].[Orders] ([Id], [UserId], [Size], [Address], [Phone], [IsCrispy], [Notes], [State], [TrackingState], [DateCreated]) VALUES (N'ad9704d3-aab2-4c72-9ab7-8fca60832154', N'080410cf-7915-4955-a24f-fbed3a988a58', 0, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2021-06-26T20:31:13.4086522+00:00' AS DateTimeOffset))
INSERT [dbo].[Orders] ([Id], [UserId], [Size], [Address], [Phone], [IsCrispy], [Notes], [State], [TrackingState], [DateCreated]) VALUES (N'375ed428-c059-4028-b748-a673435bedd7', N'b3ca2763-e8f0-4c47-abab-69ad4f8a1653', 2, N'fghdf', N'dfgh', 1, N'dfgh', 3, 3, CAST(N'2021-01-19T19:23:13.0352937+00:00' AS DateTimeOffset))
INSERT [dbo].[Orders] ([Id], [UserId], [Size], [Address], [Phone], [IsCrispy], [Notes], [State], [TrackingState], [DateCreated]) VALUES (N'b690dc42-46f7-46ed-8208-a767f810bc4a', N'2e493409-70ae-4968-bed4-6218f07df342', 2, N'dfg', N'sdfg', 0, N'sdfg', 3, 3, CAST(N'2021-01-19T22:39:54.0929223+00:00' AS DateTimeOffset))
INSERT [dbo].[Orders] ([Id], [UserId], [Size], [Address], [Phone], [IsCrispy], [Notes], [State], [TrackingState], [DateCreated]) VALUES (N'ceeeabd4-3896-4d18-9e1e-ab396e7535b2', N'357b0172-45af-4462-907b-4ff05cdc77df', 0, NULL, NULL, 0, NULL, 0, 0, CAST(N'2021-01-19T20:55:25.2368245+00:00' AS DateTimeOffset))
INSERT [dbo].[Orders] ([Id], [UserId], [Size], [Address], [Phone], [IsCrispy], [Notes], [State], [TrackingState], [DateCreated]) VALUES (N'3180111f-9dea-4f9c-9c0c-ab6f8df1f513', N'df9bc705-9e09-4e05-9a28-e9b155bcafd7', 0, NULL, NULL, 0, NULL, 0, 0, CAST(N'2021-01-19T21:16:52.6510679+00:00' AS DateTimeOffset))
INSERT [dbo].[Orders] ([Id], [UserId], [Size], [Address], [Phone], [IsCrispy], [Notes], [State], [TrackingState], [DateCreated]) VALUES (N'd337d678-3c29-445a-a7c1-b5f09dab71f1', N'359d1fd4-7364-417a-8963-e9cb9dc2c268', 0, NULL, NULL, 0, NULL, 0, 0, CAST(N'2021-01-19T18:26:15.4896718+00:00' AS DateTimeOffset))
INSERT [dbo].[Orders] ([Id], [UserId], [Size], [Address], [Phone], [IsCrispy], [Notes], [State], [TrackingState], [DateCreated]) VALUES (N'af7f3d42-9c10-4ba1-9742-bd5ee364e886', N'2e493409-70ae-4968-bed4-6218f07df342', 2, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2021-01-20T20:42:02.7710666+00:00' AS DateTimeOffset))
INSERT [dbo].[Orders] ([Id], [UserId], [Size], [Address], [Phone], [IsCrispy], [Notes], [State], [TrackingState], [DateCreated]) VALUES (N'94b2244a-03ce-4ca8-8ac6-c5c5a37f4cf2', N'b680bb1b-545f-462e-9960-9932bff6003b', 0, NULL, NULL, 0, NULL, 0, 0, CAST(N'2021-01-19T21:01:56.0657337+00:00' AS DateTimeOffset))
INSERT [dbo].[Orders] ([Id], [UserId], [Size], [Address], [Phone], [IsCrispy], [Notes], [State], [TrackingState], [DateCreated]) VALUES (N'6dcc806b-af16-4f0b-86f5-cca378be1000', N'4fbfb976-706d-4f9b-8e6c-a459314a42f2', 2, NULL, NULL, NULL, NULL, 1, 0, CAST(N'2021-01-20T20:00:09.8447386+00:00' AS DateTimeOffset))
INSERT [dbo].[Orders] ([Id], [UserId], [Size], [Address], [Phone], [IsCrispy], [Notes], [State], [TrackingState], [DateCreated]) VALUES (N'369a8fa6-dbd6-4076-916f-d031f40bbb91', N'2e493409-70ae-4968-bed4-6218f07df342', 2, N'gsdfg', N'sdfg', 1, NULL, 3, 3, CAST(N'2021-01-19T22:32:48.1631979+00:00' AS DateTimeOffset))
INSERT [dbo].[Orders] ([Id], [UserId], [Size], [Address], [Phone], [IsCrispy], [Notes], [State], [TrackingState], [DateCreated]) VALUES (N'6b70e51f-009a-4d8f-a559-d34b028306e8', N'b441d358-3685-464d-9ad7-bb49642186eb', 0, NULL, NULL, NULL, NULL, 0, 0, CAST(N'2021-06-26T20:01:05.6544363+00:00' AS DateTimeOffset))
INSERT [dbo].[Orders] ([Id], [UserId], [Size], [Address], [Phone], [IsCrispy], [Notes], [State], [TrackingState], [DateCreated]) VALUES (N'c9928b56-9429-4890-9227-d71e42e5b201', N'beea82d7-846c-491f-a73d-733f8a1128c5', 0, NULL, NULL, 0, NULL, 0, 0, CAST(N'2021-01-19T20:42:34.0914624+00:00' AS DateTimeOffset))
INSERT [dbo].[Orders] ([Id], [UserId], [Size], [Address], [Phone], [IsCrispy], [Notes], [State], [TrackingState], [DateCreated]) VALUES (N'1b9eea62-e34b-463e-9945-db146ffc386f', N'e7135730-6884-4efb-b243-a632d732e347', 0, NULL, NULL, 0, NULL, 0, 0, CAST(N'2021-01-17T19:34:15.5178599+00:00' AS DateTimeOffset))
INSERT [dbo].[Orders] ([Id], [UserId], [Size], [Address], [Phone], [IsCrispy], [Notes], [State], [TrackingState], [DateCreated]) VALUES (N'4c934248-f25d-4162-8753-e90e36d9f7cf', N'14697877-9697-48c2-a5c3-28974a66aee7', 0, NULL, NULL, 0, NULL, 0, 0, CAST(N'2021-01-19T18:36:18.1026746+00:00' AS DateTimeOffset))
INSERT [dbo].[Orders] ([Id], [UserId], [Size], [Address], [Phone], [IsCrispy], [Notes], [State], [TrackingState], [DateCreated]) VALUES (N'3b10418e-b9c0-489c-9fea-fe9e4e3342a4', N'e7135730-6884-4efb-b243-a632d732e347', 0, N'gsdfg', N'sdfgs', 1, N'sdfg', 3, 3, CAST(N'2021-01-17T17:36:59.0382450+00:00' AS DateTimeOffset))
GO
/****** Object:  Index [IX_Is4_ApiResourceClaims_ApiResourceId]    Script Date: 26 Jun 2021 23:35:02 ******/
CREATE NONCLUSTERED INDEX [IX_Is4_ApiResourceClaims_ApiResourceId] ON [dbo].[Is4_ApiResourceClaims]
(
	[ApiResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Is4_ApiResourceProperties_ApiResourceId]    Script Date: 26 Jun 2021 23:35:02 ******/
CREATE NONCLUSTERED INDEX [IX_Is4_ApiResourceProperties_ApiResourceId] ON [dbo].[Is4_ApiResourceProperties]
(
	[ApiResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Is4_ApiResources_Name]    Script Date: 26 Jun 2021 23:35:02 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Is4_ApiResources_Name] ON [dbo].[Is4_ApiResources]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Is4_ApiResourceScopes_ApiResourceId]    Script Date: 26 Jun 2021 23:35:02 ******/
CREATE NONCLUSTERED INDEX [IX_Is4_ApiResourceScopes_ApiResourceId] ON [dbo].[Is4_ApiResourceScopes]
(
	[ApiResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Is4_ApiResourceSecrets_ApiResourceId]    Script Date: 26 Jun 2021 23:35:02 ******/
CREATE NONCLUSTERED INDEX [IX_Is4_ApiResourceSecrets_ApiResourceId] ON [dbo].[Is4_ApiResourceSecrets]
(
	[ApiResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Is4_ApiScopeClaims_ScopeId]    Script Date: 26 Jun 2021 23:35:02 ******/
CREATE NONCLUSTERED INDEX [IX_Is4_ApiScopeClaims_ScopeId] ON [dbo].[Is4_ApiScopeClaims]
(
	[ScopeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Is4_ApiScopeProperties_ScopeId]    Script Date: 26 Jun 2021 23:35:02 ******/
CREATE NONCLUSTERED INDEX [IX_Is4_ApiScopeProperties_ScopeId] ON [dbo].[Is4_ApiScopeProperties]
(
	[ScopeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Is4_ApiScopes_Name]    Script Date: 26 Jun 2021 23:35:02 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Is4_ApiScopes_Name] ON [dbo].[Is4_ApiScopes]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_is4_AspNetRoleClaims_RoleId]    Script Date: 26 Jun 2021 23:35:02 ******/
CREATE NONCLUSTERED INDEX [IX_is4_AspNetRoleClaims_RoleId] ON [dbo].[is4_AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 26 Jun 2021 23:35:02 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[is4_AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_is4_AspNetUserClaims_UserId]    Script Date: 26 Jun 2021 23:35:02 ******/
CREATE NONCLUSTERED INDEX [IX_is4_AspNetUserClaims_UserId] ON [dbo].[is4_AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_is4_AspNetUserLogins_UserId]    Script Date: 26 Jun 2021 23:35:02 ******/
CREATE NONCLUSTERED INDEX [IX_is4_AspNetUserLogins_UserId] ON [dbo].[is4_AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_is4_AspNetUserRoles_RoleId]    Script Date: 26 Jun 2021 23:35:02 ******/
CREATE NONCLUSTERED INDEX [IX_is4_AspNetUserRoles_RoleId] ON [dbo].[is4_AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 26 Jun 2021 23:35:02 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[is4_AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 26 Jun 2021 23:35:02 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[is4_AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Is4_ClientClaims_ClientId]    Script Date: 26 Jun 2021 23:35:02 ******/
CREATE NONCLUSTERED INDEX [IX_Is4_ClientClaims_ClientId] ON [dbo].[Is4_ClientClaims]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Is4_ClientCorsOrigins_ClientId]    Script Date: 26 Jun 2021 23:35:02 ******/
CREATE NONCLUSTERED INDEX [IX_Is4_ClientCorsOrigins_ClientId] ON [dbo].[Is4_ClientCorsOrigins]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Is4_ClientGrantTypes_ClientId]    Script Date: 26 Jun 2021 23:35:02 ******/
CREATE NONCLUSTERED INDEX [IX_Is4_ClientGrantTypes_ClientId] ON [dbo].[Is4_ClientGrantTypes]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Is4_ClientIdPRestrictions_ClientId]    Script Date: 26 Jun 2021 23:35:02 ******/
CREATE NONCLUSTERED INDEX [IX_Is4_ClientIdPRestrictions_ClientId] ON [dbo].[Is4_ClientIdPRestrictions]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Is4_ClientPostLogoutRedirectUris_ClientId]    Script Date: 26 Jun 2021 23:35:02 ******/
CREATE NONCLUSTERED INDEX [IX_Is4_ClientPostLogoutRedirectUris_ClientId] ON [dbo].[Is4_ClientPostLogoutRedirectUris]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Is4_ClientProperties_ClientId]    Script Date: 26 Jun 2021 23:35:02 ******/
CREATE NONCLUSTERED INDEX [IX_Is4_ClientProperties_ClientId] ON [dbo].[Is4_ClientProperties]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Is4_ClientRedirectUris_ClientId]    Script Date: 26 Jun 2021 23:35:02 ******/
CREATE NONCLUSTERED INDEX [IX_Is4_ClientRedirectUris_ClientId] ON [dbo].[Is4_ClientRedirectUris]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Is4_Clients_ClientId]    Script Date: 26 Jun 2021 23:35:02 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Is4_Clients_ClientId] ON [dbo].[Is4_Clients]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Is4_ClientScopes_ClientId]    Script Date: 26 Jun 2021 23:35:02 ******/
CREATE NONCLUSTERED INDEX [IX_Is4_ClientScopes_ClientId] ON [dbo].[Is4_ClientScopes]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Is4_ClientSecrets_ClientId]    Script Date: 26 Jun 2021 23:35:02 ******/
CREATE NONCLUSTERED INDEX [IX_Is4_ClientSecrets_ClientId] ON [dbo].[Is4_ClientSecrets]
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Is4_DeviceCodes_DeviceCode]    Script Date: 26 Jun 2021 23:35:02 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Is4_DeviceCodes_DeviceCode] ON [dbo].[Is4_DeviceCodes]
(
	[DeviceCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Is4_DeviceCodes_Expiration]    Script Date: 26 Jun 2021 23:35:02 ******/
CREATE NONCLUSTERED INDEX [IX_Is4_DeviceCodes_Expiration] ON [dbo].[Is4_DeviceCodes]
(
	[Expiration] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Is4_IdentityResourceClaims_IdentityResourceId]    Script Date: 26 Jun 2021 23:35:02 ******/
CREATE NONCLUSTERED INDEX [IX_Is4_IdentityResourceClaims_IdentityResourceId] ON [dbo].[Is4_IdentityResourceClaims]
(
	[IdentityResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Is4_IdentityResourceProperties_IdentityResourceId]    Script Date: 26 Jun 2021 23:35:02 ******/
CREATE NONCLUSTERED INDEX [IX_Is4_IdentityResourceProperties_IdentityResourceId] ON [dbo].[Is4_IdentityResourceProperties]
(
	[IdentityResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Is4_IdentityResources_Name]    Script Date: 26 Jun 2021 23:35:02 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Is4_IdentityResources_Name] ON [dbo].[Is4_IdentityResources]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Is4_PersistedGrants_Expiration]    Script Date: 26 Jun 2021 23:35:02 ******/
CREATE NONCLUSTERED INDEX [IX_Is4_PersistedGrants_Expiration] ON [dbo].[Is4_PersistedGrants]
(
	[Expiration] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Is4_PersistedGrants_SubjectId_ClientId_Type]    Script Date: 26 Jun 2021 23:35:02 ******/
CREATE NONCLUSTERED INDEX [IX_Is4_PersistedGrants_SubjectId_ClientId_Type] ON [dbo].[Is4_PersistedGrants]
(
	[SubjectId] ASC,
	[ClientId] ASC,
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Is4_PersistedGrants_SubjectId_SessionId_Type]    Script Date: 26 Jun 2021 23:35:02 ******/
CREATE NONCLUSTERED INDEX [IX_Is4_PersistedGrants_SubjectId_SessionId_Type] ON [dbo].[Is4_PersistedGrants]
(
	[SubjectId] ASC,
	[SessionId] ASC,
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Is4_ApiResourceClaims]  WITH CHECK ADD  CONSTRAINT [FK_Is4_ApiResourceClaims_Is4_ApiResources_ApiResourceId] FOREIGN KEY([ApiResourceId])
REFERENCES [dbo].[Is4_ApiResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Is4_ApiResourceClaims] CHECK CONSTRAINT [FK_Is4_ApiResourceClaims_Is4_ApiResources_ApiResourceId]
GO
ALTER TABLE [dbo].[Is4_ApiResourceProperties]  WITH CHECK ADD  CONSTRAINT [FK_Is4_ApiResourceProperties_Is4_ApiResources_ApiResourceId] FOREIGN KEY([ApiResourceId])
REFERENCES [dbo].[Is4_ApiResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Is4_ApiResourceProperties] CHECK CONSTRAINT [FK_Is4_ApiResourceProperties_Is4_ApiResources_ApiResourceId]
GO
ALTER TABLE [dbo].[Is4_ApiResourceScopes]  WITH CHECK ADD  CONSTRAINT [FK_Is4_ApiResourceScopes_Is4_ApiResources_ApiResourceId] FOREIGN KEY([ApiResourceId])
REFERENCES [dbo].[Is4_ApiResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Is4_ApiResourceScopes] CHECK CONSTRAINT [FK_Is4_ApiResourceScopes_Is4_ApiResources_ApiResourceId]
GO
ALTER TABLE [dbo].[Is4_ApiResourceSecrets]  WITH CHECK ADD  CONSTRAINT [FK_Is4_ApiResourceSecrets_Is4_ApiResources_ApiResourceId] FOREIGN KEY([ApiResourceId])
REFERENCES [dbo].[Is4_ApiResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Is4_ApiResourceSecrets] CHECK CONSTRAINT [FK_Is4_ApiResourceSecrets_Is4_ApiResources_ApiResourceId]
GO
ALTER TABLE [dbo].[Is4_ApiScopeClaims]  WITH CHECK ADD  CONSTRAINT [FK_Is4_ApiScopeClaims_Is4_ApiScopes_ScopeId] FOREIGN KEY([ScopeId])
REFERENCES [dbo].[Is4_ApiScopes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Is4_ApiScopeClaims] CHECK CONSTRAINT [FK_Is4_ApiScopeClaims_Is4_ApiScopes_ScopeId]
GO
ALTER TABLE [dbo].[Is4_ApiScopeProperties]  WITH CHECK ADD  CONSTRAINT [FK_Is4_ApiScopeProperties_Is4_ApiScopes_ScopeId] FOREIGN KEY([ScopeId])
REFERENCES [dbo].[Is4_ApiScopes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Is4_ApiScopeProperties] CHECK CONSTRAINT [FK_Is4_ApiScopeProperties_Is4_ApiScopes_ScopeId]
GO
ALTER TABLE [dbo].[is4_AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_is4_AspNetRoleClaims_is4_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[is4_AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[is4_AspNetRoleClaims] CHECK CONSTRAINT [FK_is4_AspNetRoleClaims_is4_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[is4_AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_is4_AspNetUserClaims_is4_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[is4_AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[is4_AspNetUserClaims] CHECK CONSTRAINT [FK_is4_AspNetUserClaims_is4_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[is4_AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_is4_AspNetUserLogins_is4_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[is4_AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[is4_AspNetUserLogins] CHECK CONSTRAINT [FK_is4_AspNetUserLogins_is4_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[is4_AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_is4_AspNetUserRoles_is4_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[is4_AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[is4_AspNetUserRoles] CHECK CONSTRAINT [FK_is4_AspNetUserRoles_is4_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[is4_AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_is4_AspNetUserRoles_is4_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[is4_AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[is4_AspNetUserRoles] CHECK CONSTRAINT [FK_is4_AspNetUserRoles_is4_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[is4_AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_is4_AspNetUserTokens_is4_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[is4_AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[is4_AspNetUserTokens] CHECK CONSTRAINT [FK_is4_AspNetUserTokens_is4_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Is4_ClientClaims]  WITH CHECK ADD  CONSTRAINT [FK_Is4_ClientClaims_Is4_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Is4_Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Is4_ClientClaims] CHECK CONSTRAINT [FK_Is4_ClientClaims_Is4_Clients_ClientId]
GO
ALTER TABLE [dbo].[Is4_ClientCorsOrigins]  WITH CHECK ADD  CONSTRAINT [FK_Is4_ClientCorsOrigins_Is4_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Is4_Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Is4_ClientCorsOrigins] CHECK CONSTRAINT [FK_Is4_ClientCorsOrigins_Is4_Clients_ClientId]
GO
ALTER TABLE [dbo].[Is4_ClientGrantTypes]  WITH CHECK ADD  CONSTRAINT [FK_Is4_ClientGrantTypes_Is4_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Is4_Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Is4_ClientGrantTypes] CHECK CONSTRAINT [FK_Is4_ClientGrantTypes_Is4_Clients_ClientId]
GO
ALTER TABLE [dbo].[Is4_ClientIdPRestrictions]  WITH CHECK ADD  CONSTRAINT [FK_Is4_ClientIdPRestrictions_Is4_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Is4_Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Is4_ClientIdPRestrictions] CHECK CONSTRAINT [FK_Is4_ClientIdPRestrictions_Is4_Clients_ClientId]
GO
ALTER TABLE [dbo].[Is4_ClientPostLogoutRedirectUris]  WITH CHECK ADD  CONSTRAINT [FK_Is4_ClientPostLogoutRedirectUris_Is4_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Is4_Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Is4_ClientPostLogoutRedirectUris] CHECK CONSTRAINT [FK_Is4_ClientPostLogoutRedirectUris_Is4_Clients_ClientId]
GO
ALTER TABLE [dbo].[Is4_ClientProperties]  WITH CHECK ADD  CONSTRAINT [FK_Is4_ClientProperties_Is4_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Is4_Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Is4_ClientProperties] CHECK CONSTRAINT [FK_Is4_ClientProperties_Is4_Clients_ClientId]
GO
ALTER TABLE [dbo].[Is4_ClientRedirectUris]  WITH CHECK ADD  CONSTRAINT [FK_Is4_ClientRedirectUris_Is4_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Is4_Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Is4_ClientRedirectUris] CHECK CONSTRAINT [FK_Is4_ClientRedirectUris_Is4_Clients_ClientId]
GO
ALTER TABLE [dbo].[Is4_ClientScopes]  WITH CHECK ADD  CONSTRAINT [FK_Is4_ClientScopes_Is4_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Is4_Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Is4_ClientScopes] CHECK CONSTRAINT [FK_Is4_ClientScopes_Is4_Clients_ClientId]
GO
ALTER TABLE [dbo].[Is4_ClientSecrets]  WITH CHECK ADD  CONSTRAINT [FK_Is4_ClientSecrets_Is4_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Is4_Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Is4_ClientSecrets] CHECK CONSTRAINT [FK_Is4_ClientSecrets_Is4_Clients_ClientId]
GO
ALTER TABLE [dbo].[Is4_IdentityResourceClaims]  WITH CHECK ADD  CONSTRAINT [FK_Is4_IdentityResourceClaims_Is4_IdentityResources_IdentityResourceId] FOREIGN KEY([IdentityResourceId])
REFERENCES [dbo].[Is4_IdentityResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Is4_IdentityResourceClaims] CHECK CONSTRAINT [FK_Is4_IdentityResourceClaims_Is4_IdentityResources_IdentityResourceId]
GO
ALTER TABLE [dbo].[Is4_IdentityResourceProperties]  WITH CHECK ADD  CONSTRAINT [FK_Is4_IdentityResourceProperties_Is4_IdentityResources_IdentityResourceId] FOREIGN KEY([IdentityResourceId])
REFERENCES [dbo].[Is4_IdentityResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Is4_IdentityResourceProperties] CHECK CONSTRAINT [FK_Is4_IdentityResourceProperties_Is4_IdentityResources_IdentityResourceId]
GO
